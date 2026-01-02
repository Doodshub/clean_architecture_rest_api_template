import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:clean_architecture_template/common/bloc/event.dart';
import 'package:clean_architecture_template/common/bloc/state.dart';
import 'package:clean_architecture_template/common/models/user/user.dart';
import 'package:clean_architecture_template/common/services/modal_service.dart';
import 'package:clean_architecture_template/common/services/user_service.dart';
import 'package:clean_architecture_template/common/widgets/app_dialog.dart';
import 'package:clean_architecture_template/data/database/database_service.dart';
import 'package:clean_architecture_template/data/database/databases.dart';
import 'package:clean_architecture_template/data/repositories/authentication_repository.dart';
import 'package:clean_architecture_template/dependencies/dependency_manager.dart';
import 'package:logger/web.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;
  // final TokenService tokenService;

  StreamSubscription<BaseUser?>? userSubscription;

  AuthenticationBloc()
    : _authenticationRepository = sl<AuthenticationRepository>(),
      // tokenService = sl<TokenService>(),
      super(AuthenticationState.initial()) {
    on<RegisterUser>(_onRegisterUser);
    on<LoginUser>(_onLoginUser);
    on<UserStream>(_onUserStream);

    on<UserAsUnAuthenticatedStream>(_onUserAsUnAuthenticatedStream);
    on<FetchUser>(_onFetchUser);
  }

  void init() {
    userSubscription?.cancel();
    final userService = sl<UserService>();
    userSubscription = userService.listenToUser().listen((user) {
      if (user == null) {
        add(const UserAsUnAuthenticatedStream());
        return;
      }

      add(UserStream(user));
    });
  }

  @override
  Future<void> close() {
    // Cancel the subscription when the bloc is closed
    userSubscription?.cancel();
    return super.close();
  }

  FutureOr<void> _onRegisterUser(
    RegisterUser event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(isRegisteringUser: true));
    try {
      await _authenticationRepository.register(
        username: event.email,
        password: event.password,
      );

      await _loginAndStoreCredentials(
        email: event.email,
        password: event.password,
      );

      add(const FetchUser());

      emit(state.copyWith(isRegisteringUser: false));
    } catch (e) {
      emit(state.copyWith(isRegisteringUser: false));
      await sl<ModalService>().show((modalActions) {
        return AppDialog(
          // subtitle: e.message,
          actionButtonTitle: "Ok",
          onActionButtonClick: () async {
            modalActions.dismiss();
          },
        );
      }, barrierDismissible: true);
    }
  }

  FutureOr<void> _onLoginUser(
    LoginUser event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(isLoggingIn: true));
    try {
      await _loginAndStoreCredentials(
        email: event.email,
        password: event.password,
      );

      emit(state.copyWith(isLoggingIn: false));
    } catch (e) {
      emit(state.copyWith(isLoggingIn: false));
      await sl<ModalService>().show((modalActions) {
        return AppDialog(
          // subtitle: e.message,
          actionButtonTitle: "Ok",
          onActionButtonClick: () async {
            modalActions.dismiss();
          },
        );
      }, barrierDismissible: true);
    }
  }

  Future<void> _loginAndStoreCredentials({
    required String email,
    required String password,
  }) async {
    try {
      final sessionToken = await _authenticationRepository.login(
        email: email,
        password: password,
      );

      if (sessionToken == null) {
        return;
      }

      // await tokenService.persistToken(sessionToken.token!);

      await getMeAndUpdateTheLocalUser();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getMeAndUpdateTheLocalUser() async {
    var user = await _authenticationRepository.getMe();

    if (user == null) {
      return;
    }

    // Note: Consuming apps must ensure their User model's fromJson creates
    // an authenticated user, or they should override this method
    final databaseService = sl<DatabaseService>();
    await databaseService.insertOrUpdate(
      UserDatabase().name,
      user.id.toString(),
      user.toJson(),
    );
  }

  FutureOr<void> _onUserStream(
    UserStream event,
    Emitter<AuthenticationState> emit,
  ) async {
    if (event.user == state.user) return;

    emit(state.copyWith(user: event.user));
  }

  FutureOr<void> _onUserAsUnAuthenticatedStream(
    UserAsUnAuthenticatedStream event,
    Emitter<AuthenticationState> emit,
  ) async {
    // Clear user - mark as unauthenticated
    emit(state.copyWith(user: null));
  }

  FutureOr<void> _onFetchUser(
    FetchUser event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(isFetchingUser: true));
    final user = await _authenticationRepository.getMe();

    if (user == null) {
      emit(state.copyWith(isFetchingUser: false));
      return;
    }

    sl<Logger>().i({'User': user.toJson()});

    // Store user in database
    final databaseService = sl<DatabaseService>();
    await databaseService.insertOrUpdate(
      UserDatabase().name,
      user.id.toString(),
      user.toJson(),
    );

    emit(state.copyWith(isFetchingUser: false));
  }
}

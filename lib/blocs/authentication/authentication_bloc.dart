import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:clean_architecture_template/common/bloc/event.dart';
import 'package:clean_architecture_template/common/bloc/state.dart';
import 'package:clean_architecture_template/common/models/user/user.dart';
import 'package:clean_architecture_template/common/services/user_service.dart';
import 'package:clean_architecture_template/data/database/database_service.dart';
import 'package:clean_architecture_template/data/database/databases.dart';
import 'package:clean_architecture_template/dependencies/dependency_manager.dart';
import 'package:clean_architecture_template/services/token_service.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  StreamSubscription<BaseUser?>? userSubscription;

  AuthenticationBloc() : super(AuthenticationState.initial()) {
    on<UserStream>(_onUserStream);
    on<UserAsUnAuthenticatedStream>(_onUserAsUnAuthenticatedStream);
    on<Logout>(_onLogout);
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

  FutureOr<void> _onLogout(
    Logout event,
    Emitter<AuthenticationState> emit,
  ) async {
    await sl<TokenService>().deleteToken();
    await sl<DatabaseService>().deleteAll(UserDatabase().name);
    emit(state.copyWith(user: null));
  }
}

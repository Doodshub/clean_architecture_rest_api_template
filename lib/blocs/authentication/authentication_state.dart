part of 'authentication_bloc.dart';

class AuthenticationState extends BlocState {
  final bool? isLoggingIn;
  final bool? isRegisteringUser;
  final BaseUser? user;
  final Exception? error;
  final bool? isFetchingUser;

  const AuthenticationState({
    this.isLoggingIn,
    this.isRegisteringUser,
    this.user,
    this.error,
    this.isFetchingUser,
  });

  @override
  List<Object?> get props => [
    isLoggingIn,
    isRegisteringUser,
    user,
    error,
    isFetchingUser,
  ];

  AuthenticationState copyWith({
    bool? isLoggingIn,
    bool? isRegisteringUser,
    BaseUser? user,
    bool? isIntentToLogout,
    Exception? error,
    bool? isFetchingUser,
  }) {
    return AuthenticationState(
      isLoggingIn: isLoggingIn ?? this.isLoggingIn,
      isRegisteringUser: isRegisteringUser ?? this.isRegisteringUser,
      user: user ?? this.user,
      error: error ?? this.error,
      isFetchingUser: isFetchingUser ?? this.isFetchingUser,
    );
  }

  factory AuthenticationState.initial() {
    return const AuthenticationState(
      isLoggingIn: false,
      isRegisteringUser: false,
      user: null,
      error: null,
      isFetchingUser: false,
    );
  }
}

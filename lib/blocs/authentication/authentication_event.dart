part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends BlocEvent {
  const AuthenticationEvent();
}

/// User stream event for listening to user authentication status
class UserStream extends AuthenticationEvent {
  final BaseUser? user;

  const UserStream(this.user);
  @override
  List<Object> get props => [];
}

/// Event when user is unauthenticated
class UserAsUnAuthenticatedStream extends AuthenticationEvent {
  const UserAsUnAuthenticatedStream();
  @override
  List<Object> get props => [];
}

/// Logout event - clears token and user data
class Logout extends AuthenticationEvent {
  const Logout();
  @override
  List<Object> get props => [];
}

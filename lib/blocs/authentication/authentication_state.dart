part of 'authentication_bloc.dart';

class AuthenticationState extends BlocState {
  final BaseUser? user;

  const AuthenticationState({this.user});

  @override
  List<Object?> get props => [user];

  AuthenticationState copyWith({BaseUser? user}) {
    return AuthenticationState(user: user ?? this.user);
  }

  factory AuthenticationState.initial() {
    return const AuthenticationState(user: null);
  }
}

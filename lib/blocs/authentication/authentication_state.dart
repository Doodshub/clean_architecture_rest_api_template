part of 'authentication_bloc.dart';

class AuthenticationState extends BlocState {
  final BaseUser? user;

  const AuthenticationState({this.user});

  @override
  List<Object?> get props => [user];

  static const _undefined = _Undefined();

  AuthenticationState copyWith({Object? user = _undefined}) {
    return AuthenticationState(
      user: identical(user, _undefined) ? this.user : user as BaseUser?,
    );
  }

  factory AuthenticationState.initial() {
    return const AuthenticationState(user: null);
  }
}

class _Undefined {
  const _Undefined();
}

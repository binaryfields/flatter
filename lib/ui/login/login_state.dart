part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({this.username, this.password, this.loginOp});

  final String username;
  final String password;
  final Resource loginOp;

  bool get isBusy => loginOp == Resource.loading;

  @override
  List<Object> get props => [username, password, loginOp];

  LoginState copyWith({
    String username,
    String password,
    Resource loginOp,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      loginOp: loginOp ?? this.loginOp,
    );
  }
}

import 'package:equatable/equatable.dart';
import 'package:flatter/util/resource.dart';

class LoginState extends Equatable {
  final String? username;
  final String? password;
  final Resource<void> loginOp;

  const LoginState({
    this.username,
    this.password,
    this.loginOp = const Resource.idle(),
  });

  bool get isBusy => loginOp is Loading;

  @override
  List<Object?> get props => [username, password, loginOp];

  LoginState copyWith({
    String? username,
    String? password,
    Resource? loginOp,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      loginOp: loginOp ?? this.loginOp,
    );
  }
}

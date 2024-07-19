import 'package:flatter/util/resource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc() : super(const LoginState());

  Future<void> login() async {
    try {
      emit(state.copyWith(loginOp: const Resource.loading()));
      await Future.delayed(const Duration(milliseconds: 1000));
      emit(state.copyWith(loginOp: const Resource.success(null)));
    } catch (e) {
      emit(state.copyWith(loginOp: Resource.failure(e.toString())));
    }
  }

  void usernameChanged(String? value) {
    emit(state.copyWith(username: value));
  }

  void passwordChanged(String? value) {
    emit(state.copyWith(password: value));
  }
}

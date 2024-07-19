import 'package:flatter/util/resource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'settings_state.dart';

class SettingsBloc extends Cubit<SettingsState> {
  SettingsBloc() : super(const SettingsState());

  Future<void> init() async {
    emit(state);
  }

  Future<void> submit() async {
    try {
      emit(state.copyWith(submitOp: const Resource.loading()));
      await Future.delayed(const Duration(milliseconds: 1000));
      emit(state.copyWith(submitOp: const Resource.success(null)));
    } catch (e) {
      emit(state.copyWith(submitOp: Resource.failure(e.toString())));
    }
  }

  void emailChanged(bool? value) {
    emit(state.copyWith(email: value));
  }

  void notificationsChanged(bool? value) {
    emit(state.copyWith(notifications: value));
  }
}

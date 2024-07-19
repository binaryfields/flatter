import 'package:equatable/equatable.dart';
import 'package:flatter/util/resource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_state.dart';

class SettingsBloc extends Cubit<SettingsState> {
  SettingsBloc() : super(const SettingsState());

  Future<void> init() async {
    emit(state.copyWith(status: Resource.success));
  }

  Future<void> submit() async {
    try {
      emit(state.copyWith(submitOp: Resource.loading));
      await Future.delayed(const Duration(milliseconds: 1000));
      emit(state.copyWith(submitOp: Resource.success));
    } on Exception {
      emit(state.copyWith(submitOp: Resource.error));
    }
  }

  void emailChanged(bool? value) {
    emit(state.copyWith(email: value));
  }

  void notificationsChanged(bool? value) {
    emit(state.copyWith(notifications: value));
  }
}

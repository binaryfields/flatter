import 'package:equatable/equatable.dart';
import 'package:flatter/util/resource.dart';

class SettingsState extends Equatable {
  const SettingsState({
    this.email = false,
    this.notifications = false,
    this.submitOp = const Resource.idle(),
  });

  final bool email;
  final bool notifications;
  final Resource<void> submitOp;

  bool get isBusy => submitOp is Loading;

  @override
  List<Object?> get props => [email, notifications, submitOp];

  SettingsState copyWith({
    bool? email,
    bool? notifications,
    Resource? submitOp,
  }) {
    return SettingsState(
      email: email ?? this.email,
      notifications: notifications ?? this.notifications,
      submitOp: submitOp ?? this.submitOp,
    );
  }
}

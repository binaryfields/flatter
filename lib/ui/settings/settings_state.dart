part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  const SettingsState({
    this.status = Resource.initial,
    this.email,
    this.notifications,
    this.submitOp = Resource.initial,
  });

  final Resource status;
  final bool email;
  final bool notifications;

  final Resource submitOp;

  bool get isBusy => submitOp == Resource.loading;

  @override
  List<Object> get props => [status, email, notifications, submitOp];

  SettingsState copyWith({
    Resource status,
    bool email,
    bool notifications,
    Resource submitOp,
  }) {
    return SettingsState(
      status: status ?? this.status,
      email: email ?? this.email,
      notifications: notifications ?? this.notifications,
      submitOp: submitOp ?? this.submitOp,
    );
  }
}

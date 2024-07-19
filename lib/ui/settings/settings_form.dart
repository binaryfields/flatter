import 'package:flatter/util/locale.dart';
import 'package:flatter/widget/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'settings_bloc.dart';
import 'settings_state.dart';

class SettingsForm extends StatelessWidget {
  SettingsForm({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: ListBody(
            children: _buildFields(context, state),
          ),
        );
      },
    );
  }

  List<Widget> _buildFields(BuildContext context, SettingsState state) {
    return [
      SwitchFormField(
        title: Text(context.l10n().settingsNotificationsLabel),
        initialValue: state.notifications,
        secondary: const Icon(Icons.notifications),
        onSaved: (value) =>
            context.read<SettingsBloc>().notificationsChanged(value),
      ),
      CheckboxFormField(
        title: Text(context.l10n().settingsEmailLabel),
        initialValue: state.email,
        secondary: const Icon(Icons.email),
        onSaved: (value) => context.read<SettingsBloc>().emailChanged(value),
      ),
      ElevatedButton(
        child: Text(context.l10n().actionSave),
        onPressed: () => _onSubmit(context),
      ),
    ];
  }

  void _onSubmit(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      context.read<SettingsBloc>().submit();
    }
  }
}

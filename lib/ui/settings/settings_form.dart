import 'package:flatter/util/locale.dart';
import 'package:flatter/widget/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'settings_bloc.dart';

class SettingsForm extends StatelessWidget {
  SettingsForm({Key key}) : super(key: key);

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
        initialValue: state.notifications ?? false,
        secondary: Icon(Icons.notifications),
        onSaved: (bool value) =>
            context.read<SettingsBloc>().notificationsChanged(value),
      ),
      CheckboxFormField(
        title: Text(context.l10n().settingsEmailLabel),
        initialValue: state.email ?? false,
        secondary: Icon(Icons.email),
        onSaved: (bool value) =>
            context.read<SettingsBloc>().emailChanged(value),
      ),
      RaisedButton(
        child: Text(context.l10n().actionSave),
        onPressed: () => _onSubmit(context),
      ),
    ];
  }

  void _onSubmit(BuildContext context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      context.read<SettingsBloc>().submit();
    }
  }
}

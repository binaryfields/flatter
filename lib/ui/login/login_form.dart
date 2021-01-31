import 'package:flatter/util/locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validate/validate.dart';

import 'login_bloc.dart';

class LoginForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Form(
        key: _formKey,
        child: ListBody(
          children: _buildFields(context, state),
        ),
      );
    });
  }

  List<Widget> _buildFields(BuildContext context, LoginState state) {
    return [
      Container(
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: NetworkImage(
              'https://flutter.io/images/catalog-widget-placeholder.png',
            ),
          ),
        ),
      ),
      TextFormField(
        decoration: _makeFieldDecoration(context.l10n().loginUsernameLabel),
        keyboardType: TextInputType.emailAddress,
        onSaved: (value) => context.read<LoginBloc>().usernameChanged(value),
        validator: (value) {
          try {
            Validate.isEmail(value);
            return null;
          } catch (e) {
            return context.l10n().loginUsernameError;
          }
        },
      ),
      const SizedBox(height: 8),
      TextFormField(
        decoration: _makeFieldDecoration(context.l10n().loginPasswordLabel),
        obscureText: true,
        onSaved: (value) => context.read<LoginBloc>().passwordChanged(value),
        validator: (value) {
          return value == null || value.trim().length < 6
              ? context.l10n().loginPasswordError
              : null;
        },
      ),
      const SizedBox(height: 24),
      RaisedButton(
        color: Theme.of(context).accentColor,
        padding: const EdgeInsets.all(12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        onPressed: () => _onLogin(context),
        child: Text(
          context.l10n().actionLogin,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      const SizedBox(height: 16),
      Center(
        child: Text(
          context.l10n().loginForgotPasswordLabel,
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    ];
  }

  void _onLogin(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      context.read<LoginBloc>().login();
    }
  }

  InputDecoration _makeFieldDecoration(String label) {
    return InputDecoration(
      hintText: label,
      contentPadding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
    );
  }
}

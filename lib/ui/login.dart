import 'package:flutter/material.dart';
import 'package:validate/validate.dart';

import '../util/widgets.dart';

class _LoginData {
  String email;
  String password;
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _data = _LoginData();
  final _formKey = GlobalKey<FormState>();

  bool _saving = false;

  void _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
        _saving = true;
      });
      Future.delayed(new Duration(seconds: 2), () {
        setState(() {
          _saving = false;
          print('Email: ${_data.email}');
          print('Password: ${_data.password}');
          Navigator.of(context).pop();
        });
      });
    }
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
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
            decoration: InputDecoration(
              hintText: 'Email',
              contentPadding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
            keyboardType: TextInputType.emailAddress,
            onSaved: (String value) => _data.email = value,
            validator: (value) {
              try {
                Validate.isEmail(value);
              } catch (e) {
                return 'Email must be a valid email address.';
              }
              return null;              
            },
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Password',
              contentPadding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
            obscureText: true,
            onSaved: (String value) => _data.password = value,
            validator: (value) {
              if (value.trim().length < 6) {
                return 'Password must be at least 6 characters.';
              }
              return null;
            },
          ),
          const SizedBox(height: 24.0),
          RaisedButton(
            color: Theme.of(context).accentColor,
            padding: const EdgeInsets.all(12.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
            onPressed: _submit,
            child: const Text(
              'LOGIN',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 16.0),
          Center(
            child: const Text(
              'Forgot Password',
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ActivityIndicator(
          busy: _saving,
          child: _buildForm(context),
        ),
      ),
    );
  }
}

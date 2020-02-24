import 'package:flutter/material.dart';

import '../util/widgets.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _email = true;
  bool _notifications = false;

  bool _saving = false;

  void _submit() {
    setState(() {
      _saving = true;
    });
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _saving = false;
        Navigator.of(context).pop();
      });
    });
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SwitchListTile(
            title: const Text('Notifications'),
            value: _notifications,
            secondary: Icon(Icons.notifications),
            onChanged: (bool value) {
              setState(() {
                _notifications = value;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Enable Email?'),
            value: _email,
            secondary: Icon(Icons.email),
            onChanged: (bool value) {
              setState(() {
                _email = value;
              });
            },
          ),
          RaisedButton(
            onPressed: _submit,
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ActivityIndicator(busy: _saving, child: _buildForm(context)),
    );
  }
}

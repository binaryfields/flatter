import 'package:flutter/material.dart';

void showError(BuildContext context, String error) {
  final snackBar = SnackBar(content: Text(error));
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}

import 'package:flatter/service/service_module.dart';
import 'package:flatter/util/di.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  _initDeps();
  runApp(const App());
}

void _initDeps() {
  ServiceModule().setup(DI);
}

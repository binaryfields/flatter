import 'package:dio/dio.dart';
import 'package:flatter/service/post_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dio_provider.dart';

class ServiceModule extends StatelessWidget {
  const ServiceModule({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Dio>(
          create: (_) => DioProvider().get(),
        ),
        ProxyProvider<Dio, PostService>(
          update: (_, dio, __) => PostService(dio: dio),
        ),
      ],
      child: child,
    );
  }
}

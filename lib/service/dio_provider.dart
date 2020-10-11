import 'dart:io';

import 'package:dio/dio.dart';

class DioProvider {
  Dio get() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com',
        connectTimeout: 5000,
        receiveTimeout: 5000,
        headers: {
          HttpHeaders.userAgentHeader: 'dio',
        },
      ),
    );
  }
}

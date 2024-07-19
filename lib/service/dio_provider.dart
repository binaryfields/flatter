import 'dart:io';

import 'package:dio/dio.dart';

class DioProvider {
  Dio get() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com',
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 5000),
        headers: {
          HttpHeaders.userAgentHeader: 'dio',
        },
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:flatter/service/post_service.dart';
import 'package:get_it/get_it.dart';

import 'dio_provider.dart';

class ServiceModule {
  void setup(GetIt di) {
    final dio = DioProvider().get();
    di.registerSingleton<Dio>(dio);
    di.registerSingleton<PostService>(PostService(dio: dio));
  }
}

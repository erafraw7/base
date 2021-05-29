import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import 'api_service.dart';

@injectable
class ApiServiceFactory {
  Dio setupDio() {
    final dio = Dio();
    if (kDebugMode) dio.interceptors.add(LogInterceptor(responseBody: true));
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      dio.interceptors.requestLock.lock();
      final box = Hive.box('settings');
      String accessToken = box.get("access_token");
      options.headers["Authorization"] = "Bearer $accessToken";
      dio.interceptors.requestLock.unlock();
    }, onError: (error, handler) {
      if (error.response?.statusCode != 200) {}
    }));

    return dio;
  }

  ApiService get() {
    return ApiService(setupDio());
  }
}

// ignore_for_file: deprecated_member_use, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioSettings {
  late Dio _dio;

  DioSettings() {
    setup();
  }

  Future<void> setup() async {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://run.mocky.io/v3/',
      contentType: 'application/json',
      headers: {'Accept': 'application/json'},
      connectTimeout: const Duration(milliseconds: 50000),
      receiveTimeout: const Duration(milliseconds: 5000),
    ));

    final interceptor = _dio.interceptors;
    interceptor.clear();

    final logInterceptor = LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true);

    final headerInterceptor = QueuedInterceptorsWrapper(
      onRequest: (options, handler) async {
        return handler.next(options);
      },
      onError: (DioError e, handler) async {
        return handler.next(e);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
    );

    interceptor.addAll([
      if (kDebugMode) logInterceptor,
      headerInterceptor,
    ]);
  }

  Dio get dio => _dio;
}

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class MockDataSource {
  MockDataSource() {
    final options = BaseOptions(
      baseUrl: 'https://json-parser.com',
    );
    _dio = Dio(options);
    _dio.interceptors.add(
      LogInterceptor(
        logPrint: (o) => debugPrint(o.toString()),
      ),
    );
  }
  late final Dio _dio;

  Future<Response<Map<String, dynamic>>> fetchObjects() async {
    return await _dio.request<Map<String, dynamic>>(_MockEndpoints.fetch);
  }
}

class _MockEndpoints {
  static const String fetch = '/f5628f20/4.json';
}

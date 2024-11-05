import 'dart:io';

import 'package:dio/dio.dart';

import '../../helper/util/hive_utils.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String? jwt = HiveBox().getValue(key: 'jwt');
    if (jwt != null) {
      options.headers[HttpHeaders.authorizationHeader] = "Bearer $jwt";
    }
    super.onRequest(options, handler);
  }
}


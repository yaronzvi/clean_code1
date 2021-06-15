import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:flutter/foundation.dart';
import '../../main.dart';
import 'package:first_proj/data/source/users/api/users_api.dart';

class NetBindingModule {
  static const CONNECT_TIMEOUT = 1000 * 10;
  static const RECEIVE_TIMEOUT = 1000 * 10;
  static const SEND_TIMEOUT = 1000 * 10;

  static provideNetModules() {
    _provideDio();
    _provideUsersApi();
  }

  static _provideDio() {
    getIt.registerFactory(() {
      final dio = Dio();
      if (kDebugMode) dio.interceptors.add(PrettyDioLogger(requestBody: true));

      dio
        ..options.connectTimeout = CONNECT_TIMEOUT
        ..options.receiveTimeout = RECEIVE_TIMEOUT
        ..options.sendTimeout = SEND_TIMEOUT;

      return dio;
    });
  }

  static void _provideUsersApi() =>
      getIt.registerFactory(() => UsersApi(getIt.get()));
}

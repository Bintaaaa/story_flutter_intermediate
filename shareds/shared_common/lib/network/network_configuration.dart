import 'dart:developer';

import 'package:shared_common/constans/constans_values.dart';
import 'package:shared_common/network/network_interceptors.dart';
import 'package:shared_libraries/dio/dio.dart';
import 'package:shared_libraries/shared_preferences/shared_preferences.dart';

class NetworkConfiguration {
  final SharedPreferences sharedPreferences;

  NetworkConfiguration({
    required this.sharedPreferences,
  });

  Dio get network => _configuration();

  Dio _configuration() {
    final Dio dio = Dio();

    const Duration duration = Duration(
      seconds: 30,
    );

    Map<String, dynamic> headers = {};

    final token = sharedPreferences.getString(
      ConstansValue.keyStorage.tokenLogin,
    );

    log("Getting token $token");

    headers["Authorization"] = "Bearer $token";
    headers['Content-Type'] = 'application/json';
    headers['Accept'] = 'application/json';

    dio.options
      ..baseUrl = ConstansValue.network.baseUrl
      ..connectTimeout = duration
      ..receiveTimeout = duration
      ..headers = headers;

    dio.interceptors.add(
      ApiInterceptor.dioLogger(),
    );

    return dio;
  }
}

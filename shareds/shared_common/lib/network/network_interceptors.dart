import 'dart:convert';
import 'dart:developer';

import 'package:shared_common/constans/constans_values.dart';
import 'package:shared_libraries/dio/dio.dart';
import 'package:shared_libraries/shared_preferences/shared_preferences.dart';

class NetworkInterceptors extends Interceptor {
  final SharedPreferences sharedPref;

  NetworkInterceptors({
    required this.sharedPref,
  });

  Map<String, dynamic> _defaultHeaders() {
    String? token = sharedPref.getString(
      ConstansValue.keyStorage.tokenLogin,
    );
    Map<String, dynamic> headers = {};

    headers['Content-Type'] = 'application/json';

    headers['Accept'] = 'application/json';

    if (token != null || token != "") {
      headers['Authorization'] = "Bearer $token";
    }

    return headers;
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final prettyString = const JsonEncoder.withIndent(' ').convert(
      response.data,
    );

    log(
      'Status Code: ${response.statusCode}\n'
      '——————————————————————————————————————————————————————————————————————\n'
      'Response : $prettyString\n',
    );
    return handler.next(response);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    try {
      final headers = _defaultHeaders();
      options.headers.addAll(headers);

      final requestBody = const JsonEncoder.withIndent('  ').convert(options.data);
      final queryParameters = const JsonEncoder.withIndent('  ').convert(options.queryParameters);
      log(
        'Request URL : ${options.uri}\n'
        '----------------------------------------------------------------------\n'
        'Header: ${options.headers}\n'
        '----------------------------------------------------------------------\n'
        'Request Body: $requestBody\n'
        '----------------------------------------------------------------------\n'
        'Request Query Parameters: $queryParameters\n'
        '----------------------------------------------------------------------\n'
        'Method: ${options.method}\n',
      );
      return handler.next(options);
    } catch (e) {
      final queryParameters = const JsonEncoder.withIndent('  ').convert(options.queryParameters);
      log(
        'Request URL : ${options.uri}\n'
        '----------------------------------------------------------------------\n'
        'Header: ${options.headers}\n'
        '----------------------------------------------------------------------\n'
        'Request Body: cannot read request body\n'
        '----------------------------------------------------------------------\n'
        'Request Query Parameters: $queryParameters\n'
        '----------------------------------------------------------------------\n'
        'Method: ${options.method}\n',
      );
      return handler.next(options);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('Dio Error : $err, ${err.response}');
    return handler.next(err);
  }
}

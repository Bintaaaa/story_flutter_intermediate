import 'package:shared_libraries/dio/dio.dart';
import 'package:shared_libraries/pretty_dio_logger/pretty_dio_logger.dart';

class ApiInterceptor {
  static Interceptor dioLogger() => PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      );
}

import 'package:shared_common/constans/constans_values.dart';
import 'package:shared_common/network/network_interceptors.dart';
import 'package:shared_libraries/dio/dio.dart';
import 'package:shared_libraries/shared_preferences/shared_preferences.dart';

class NetworkConfiguration {
  late SharedPreferences sharedPreferences;

  NetworkConfiguration({
    required this.sharedPreferences,
  });

  Dio get dio => _createDio();

  Dio _createDio() {
    final dio = Dio();

    const Duration duration = Duration(
      milliseconds: 20000,
    );

    dio
      ..options.baseUrl = ConstansValue.network.baseUrl
      ..options.connectTimeout = duration
      ..options.receiveTimeout = duration;

    dio.interceptors.add(
      NetworkInterceptors(
        sharedPref: sharedPreferences,
      ),
    );

    return dio;
  }
}

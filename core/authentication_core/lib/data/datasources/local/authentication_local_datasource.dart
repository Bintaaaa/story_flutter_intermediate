import 'package:shared_common/constans/constans_values.dart';
import 'package:shared_libraries/shared_preferences/shared_preferences.dart';

abstract class AuthenticationLocalDatasource {
  Future<bool> cacheToken({required String token});
  String getToken();
}

class AuthenticationLocalDatasourceImpl implements AuthenticationLocalDatasource {
  final SharedPreferences sharedPreferences;

  const AuthenticationLocalDatasourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<bool> cacheToken({required String token}) async {
    try {
      return await sharedPreferences.setString(
        ConstansValue.keyStorage.tokenLogin,
        token,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  String getToken() {
    final response = sharedPreferences.getString(
      ConstansValue.keyStorage.tokenLogin,
    );
    return response ?? "";
  }
}

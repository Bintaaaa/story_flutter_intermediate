import 'package:authentication_core/data/models/general_response_model.dart';
import 'package:authentication_core/data/models/register_body_model.dart';
import 'package:shared_common/constans/constans_values.dart';
import 'package:shared_libraries/dio/dio.dart';

abstract class AuthenticationRemoteDatasource {
  Future<GeneralResponseModel> signUp({
    required RegisterBodyModel params,
  });
}

class AuthenticationRemoteDatasourceImpl implements AuthenticationRemoteDatasource {
  final Dio dio;

  const AuthenticationRemoteDatasourceImpl({
    required this.dio,
  });

  @override
  Future<GeneralResponseModel> signUp({required RegisterBodyModel params}) async {
    try {
      final response = await dio.post(
        ConstansValue.network.register,
        data: params.toJson(),
      );
      return GeneralResponseModel.fromJson(
        response.data,
      );
    } catch (e) {
      rethrow;
    }
  }
}

import 'package:authentication_core/data/models/general_response_model.dart';
import 'package:authentication_core/data/models/register_body_model.dart';
import 'package:authentication_core/data/models/sign_in_body_model.dart';
import 'package:authentication_core/data/models/sign_in_response_model.dart';
import 'package:authentication_core/domain/entities/register_body_entity.dart';
import 'package:authentication_core/domain/entities/register_response_entity.dart';
import 'package:authentication_core/domain/entities/sign_in_body_entity.dart';
import 'package:authentication_core/domain/entities/sign_in_response_entity.dart';

class AuthenticationMapper {
  const AuthenticationMapper();

  RegisterResponseEntity registerResponseModelToEntity(GeneralResponseModel data) => RegisterResponseEntity(
        isSuccess: !(data.error ?? false),
      );

  RegisterBodyModel registerBodyEntityToModel(RegisterBodyEntity data) => RegisterBodyModel(
        name: data.name,
        email: data.email,
        password: data.password,
      );

  SignInResponseEntity signInResponseModelToEntity(SignInResponseModel data) => SignInResponseEntity(
        error: data.error ?? true,
        message: data.message ?? "error",
        loginResult: signInResultModelToEntity(
          data.loginResult ?? SignInResultResponseModel(),
        ),
      );

  SignInResultResponseEntity signInResultModelToEntity(SignInResultResponseModel data) => SignInResultResponseEntity(
        userId: data.userId ?? "000",
        name: data.name ?? "NOT FOUND NAME",
        token: data.token ?? "",
      );

  SignInBodyModel signInBodyEntityToModel(SignInBodyEntity data) => SignInBodyModel(email: data.email, password: data.password,);
}

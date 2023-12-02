import 'package:authentication_core/data/models/general_response_model.dart';
import 'package:authentication_core/data/models/register_body_model.dart';
import 'package:authentication_core/domain/entities/register_body_entity.dart';
import 'package:authentication_core/domain/entities/register_response_entity.dart';

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
}

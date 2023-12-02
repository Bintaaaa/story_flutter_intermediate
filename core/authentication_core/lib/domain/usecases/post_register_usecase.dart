import 'package:authentication_core/domain/entities/register_body_entity.dart';
import 'package:authentication_core/domain/entities/register_response_entity.dart';
import 'package:authentication_core/domain/repositories/authentication_repository.dart';
import 'package:shared_common/error/failure_response.dart';
import 'package:shared_common/usecase/usecase.dart';
import 'package:shared_libraries/dartz/dartz.dart';

class PostRegisterUsecase extends UseCase<RegisterResponseEntity, RegisterBodyEntity> {
  final AuthenticationRepository authenticationRepository;

  PostRegisterUsecase({required this.authenticationRepository});

  @override
  Future<Either<FailureResponse, RegisterResponseEntity>> call(RegisterBodyEntity parameter) async {
    if (parameter.password.length < 8) {
      return const Left(
        FailureResponse(
          errorMessage: "Password setidaknya 8 karakter ya",
        ),
      );
    } else {
      return await authenticationRepository.signUp(
        params: parameter,
      );
    }
  }
}

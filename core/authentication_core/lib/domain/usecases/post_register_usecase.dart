import 'package:authentication_core/domain/entities/register_body_entity.dart';
import 'package:authentication_core/domain/entities/register_response_entity.dart';
import 'package:authentication_core/domain/repositories/authentication_repository.dart';
import 'package:shared_common/error/failure_response.dart';
import 'package:shared_common/usecase/usecase.dart';
import 'package:shared_libraries/dartz/dartz.dart';

class PostRegisterUsecase
    extends UseCase<RegisterResponseEntity, RegisterBodyEntity> {
  final AuthenticationRepository authenticationRepository;

  PostRegisterUsecase({required this.authenticationRepository});

  @override
  Future<Either<FailureResponse, RegisterResponseEntity>> call(
      RegisterBodyEntity parameter) async {
    bool isEmptyAllField = parameter.name.isEmpty &&
        parameter.email.isEmpty &&
        parameter.password.isEmpty;
    if (isEmptyAllField) {
      return Left(
        FailureResponse(
          errorMessage: "Isi semua dulu",
        ),
      );
    } else if (parameter.email.isEmpty) {
      return Left(
        FailureResponse(
          errorMessage: "Isi email dulu",
        ),
      );
    } else if (parameter.password.isEmpty) {
      return Left(
        FailureResponse(
          errorMessage: "Isi password dulu",
        ),
      );
    } else if (parameter.name.isEmpty) {
      return Left(
        FailureResponse(
          errorMessage: "Isi nama ya",
        ),
      );
    } else {
      if (parameter.password.length < 8) {
        return Left(
          FailureResponse(
            errorMessage: "Password Minimal 8",
          ),
        );
      } else {
        return await authenticationRepository.signUp(
          params: parameter,
        );
      }
    }
  }
}

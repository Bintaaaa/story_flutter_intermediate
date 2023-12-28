import 'package:authentication_core/domain/entities/sign_in_body_entity.dart';
import 'package:authentication_core/domain/entities/sign_in_response_entity.dart';
import 'package:authentication_core/domain/repositories/authentication_repository.dart';
import 'package:shared_common/error/failure_response.dart';
import 'package:shared_common/usecase/usecase.dart';
import 'package:shared_libraries/dartz/dartz.dart';

class PostSignInUseCase
    extends UseCase<SignInResponseEntity, SignInBodyEntity> {
  final AuthenticationRepository authenticationRepository;

  PostSignInUseCase({required this.authenticationRepository});

  @override
  Future<Either<FailureResponse, SignInResponseEntity>> call(
      SignInBodyEntity parameter) async {
    bool isEmptyAllField =
        parameter.email.isEmpty && parameter.password.isEmpty;
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
    } else {
      if (parameter.password.length < 8) {
        return Left(
          FailureResponse(
            errorMessage: "Password Minimal 8",
          ),
        );
      } else {
        final response = await authenticationRepository.signIn(
          params: parameter,
        );

        return response.fold(
            (failure) => Left(
                  FailureResponse(
                    dioException: failure.dioException,
                    errorMessage: failure.errorMessage,
                  ),
                ), (user) async {
          await authenticationRepository.cacheToken(
            token: user.loginResult.token,
          );
          return Right(
            user,
          );
        });
      }
    }
  }
}

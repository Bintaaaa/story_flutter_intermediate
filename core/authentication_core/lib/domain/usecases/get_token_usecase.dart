import 'package:authentication_core/domain/repositories/authentication_repository.dart';
import 'package:shared_common/error/failure_response.dart';
import 'package:shared_common/usecase/usecase.dart';
import 'package:shared_libraries/dartz/dartz.dart';

class GetTokenUseCase extends UseCase<String, NoParams> {
  final AuthenticationRepository authenticationRepository;

  GetTokenUseCase({
    required this.authenticationRepository,
  });

  @override
  Future<Either<FailureResponse, String>> call(NoParams parameter) async =>
      authenticationRepository.getToken();
}

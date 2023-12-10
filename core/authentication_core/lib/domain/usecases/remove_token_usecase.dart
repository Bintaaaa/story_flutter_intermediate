import 'package:authentication_core/domain/repositories/authentication_repository.dart';
import 'package:shared_common/error/failure_response.dart';
import 'package:shared_common/usecase/usecase.dart';
import 'package:shared_libraries/dartz/dartz.dart';

class RemoveTokenUseCase extends UseCase<bool, NoParams> {
  final AuthenticationRepository authenticationRepository;

  RemoveTokenUseCase({
    required this.authenticationRepository,
  });

  @override
  Future<Either<FailureResponse, bool>> call(NoParams parameter) async => authenticationRepository.removeToken();
}

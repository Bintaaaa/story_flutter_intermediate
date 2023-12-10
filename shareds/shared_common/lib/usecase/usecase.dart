import 'package:shared_common/error/failure_response.dart';
import 'package:shared_libraries/dartz/dartz.dart';

abstract class UseCase<Response, Parameter> {
  Future<Either<FailureResponse, Response>> call(Parameter parameter);
}

class NoParams {
  const NoParams();
}

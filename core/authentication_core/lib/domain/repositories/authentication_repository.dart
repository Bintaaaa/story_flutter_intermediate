import 'package:authentication_core/domain/entities/register_body_entity.dart';
import 'package:authentication_core/domain/entities/register_response_entity.dart';
import 'package:shared_common/error/failure_response.dart';
import 'package:shared_libraries/dartz/dartz.dart';

abstract class AuthenticationRepository {
  Future<Either<FailureResponse, RegisterResponseEntity>> signUp({required RegisterBodyEntity params});
}

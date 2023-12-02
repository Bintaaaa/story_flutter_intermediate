import 'package:authentication_core/data/datasources/remote/authenteication_remote_datasource.dart';
import 'package:authentication_core/data/mappers/authentication_mapper.dart';
import 'package:authentication_core/domain/entities/register_body_entity.dart';
import 'package:authentication_core/domain/entities/register_response_entity.dart';
import 'package:authentication_core/domain/repositories/authentication_repository.dart';
import 'package:shared_common/error/failure_response.dart';
import 'package:shared_libraries/dartz/dartz.dart';
import 'package:shared_libraries/dio/dio.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDatasource authenticationRemoteDatasource;
  final AuthenticationMapper authenticationMapper;

  const AuthenticationRepositoryImpl({
    required this.authenticationRemoteDatasource,
    required this.authenticationMapper,
  });

  @override
  Future<Either<FailureResponse, RegisterResponseEntity>> signUp({required RegisterBodyEntity params}) async {
    try {
      final response = await authenticationRemoteDatasource.signUp(
        params: authenticationMapper.registerBodyEntityToModel(
          params,
        ),
      );
      return Right(
        authenticationMapper.registerResponseModelToEntity(
          response,
        ),
      );
    } on DioException catch (error) {
      return Left(
        FailureResponse(
          dioException: error,
        ),
      );
    }
  }
}

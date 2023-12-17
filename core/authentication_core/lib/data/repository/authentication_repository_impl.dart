import 'dart:developer';

import 'package:authentication_core/data/datasources/local/authentication_local_datasource.dart';
import 'package:authentication_core/data/datasources/remote/authenteication_remote_datasource.dart';
import 'package:authentication_core/data/mappers/authentication_mapper.dart';
import 'package:authentication_core/domain/entities/register_body_entity.dart';
import 'package:authentication_core/domain/entities/register_response_entity.dart';
import 'package:authentication_core/domain/entities/sign_in_body_entity.dart';
import 'package:authentication_core/domain/entities/sign_in_response_entity.dart';
import 'package:authentication_core/domain/repositories/authentication_repository.dart';
import 'package:shared_common/error/failure_response.dart';
import 'package:shared_libraries/dartz/dartz.dart';
import 'package:shared_libraries/dio/dio.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDatasource authenticationRemoteDatasource;
  final AuthenticationLocalDatasource authenticationLocalDatasource;
  final AuthenticationMapper authenticationMapper;

  const AuthenticationRepositoryImpl({
    required this.authenticationLocalDatasource,
    required this.authenticationRemoteDatasource,
    required this.authenticationMapper,
  });

  @override
  Future<Either<FailureResponse, RegisterResponseEntity>> signUp(
      {required RegisterBodyEntity params}) async {
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

  @override
  Future<Either<FailureResponse, SignInResponseEntity>> signIn(
      {required SignInBodyEntity params}) async {
    try {
      final response = await authenticationRemoteDatasource.signIn(
        params: authenticationMapper.signInBodyEntityToModel(
          params,
        ),
      );
      return Right(
        authenticationMapper.signInResponseModelToEntity(
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

  @override
  Future<Either<FailureResponse, bool>> cacheToken(
      {required String token}) async {
    try {
      log("Success Caching Token");
      final response = await authenticationLocalDatasource.cacheToken(
        token: token,
      );

      return Right(
        response,
      );
    } catch (error) {
      return Left(
        FailureResponse(
          errorMessage: "Error Local - please re-login",
        ),
      );
    }
  }

  @override
  Either<FailureResponse, String> getToken() {
    try {
      final response = authenticationLocalDatasource.getToken();
      return Right(
        response,
      );
    } catch (error) {
      return Left(
        FailureResponse(
          errorMessage: "Error Local - please re-login",
        ),
      );
    }
  }

  @override
  Future<Either<FailureResponse, bool>> removeToken() async {
    try {
      log("Success remove Token");
      final response = await authenticationLocalDatasource.removeToken();

      return Right(
        response,
      );
    } catch (error) {
      return Left(
        FailureResponse(
          errorMessage: "Error Local - please re-login",
        ),
      );
    }
  }
}

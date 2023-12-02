import 'package:authentication_core/data/datasources/local/authentication_local_datasource.dart';
import 'package:authentication_core/data/datasources/remote/authenteication_remote_datasource.dart';
import 'package:authentication_core/data/mappers/authentication_mapper.dart';
import 'package:authentication_core/data/repository/authentication_repository_impl.dart';
import 'package:authentication_core/domain/repositories/authentication_repository.dart';
import 'package:authentication_core/domain/usecases/get_token_usecase.dart';
import 'package:authentication_core/domain/usecases/post_register_usecase.dart';
import 'package:authentication_core/domain/usecases/post_sign_in_usecase.dart';
import 'package:shared_libraries/get_it/get_it.dart';

class AuthenticationInjection {
  AuthenticationInjection() {
    _datasources();
    _mappers();
    _repositories();
    _usecases();
  }

  _datasources() {
    sl.registerLazySingleton<AuthenticationRemoteDatasource>(
      () => AuthenticationRemoteDatasourceImpl(
        dio: sl(),
      ),
    );
    sl.registerLazySingleton<AuthenticationLocalDatasource>(
      () => AuthenticationLocalDatasourceImpl(
        sharedPreferences: sl(),
      ),
    );
  }

  _mappers() {
    sl.registerLazySingleton<AuthenticationMapper>(
      () => const AuthenticationMapper(),
    );
  }

  _repositories() {
    sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(
        authenticationRemoteDatasource: sl(),
        authenticationMapper: sl(),
        authenticationLocalDatasource: sl(),
      ),
    );
  }

  _usecases() {
    sl.registerLazySingleton<PostRegisterUsecase>(
      () => PostRegisterUsecase(
        authenticationRepository: sl(),
      ),
    );
    sl.registerLazySingleton<PostSignInUseCase>(
      () => PostSignInUseCase(
        authenticationRepository: sl(),
      ),
    );
    sl.registerLazySingleton<GetTokenUseCase>(
      () => GetTokenUseCase(
        authenticationRepository: sl(),
      ),
    );
  }
}

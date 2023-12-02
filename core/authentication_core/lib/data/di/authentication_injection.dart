import 'package:authentication_core/data/datasources/remote/authenteication_remote_datasource.dart';
import 'package:authentication_core/data/mappers/authentication_mapper.dart';
import 'package:authentication_core/data/repository/authentication_repository_impl.dart';
import 'package:authentication_core/domain/repositories/authentication_repository.dart';
import 'package:authentication_core/domain/usecases/post_register_usecase.dart';
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
      ),
    );
  }

  _usecases() {
    sl.registerLazySingleton<PostRegisterUsecase>(
      () => PostRegisterUsecase(
        authenticationRepository: sl(),
      ),
    );
  }
}

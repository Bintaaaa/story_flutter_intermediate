import 'package:shared_common/network/network_configuration.dart';
import 'package:shared_libraries/dio/dio.dart';
import 'package:shared_libraries/get_it/get_it.dart';

class SharedCommonInjection{
   SharedCommonInjection(){
    _networkInjection();
  }

  _networkInjection(){
    sl.registerLazySingleton<Dio>(() => sl<NetworkConfiguration>().network,);
    sl.registerLazySingleton<NetworkConfiguration>(() => NetworkConfiguration(sharedPreferences: sl(),),);
  }
}
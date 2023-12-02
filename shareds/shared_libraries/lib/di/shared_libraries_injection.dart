import 'package:shared_libraries/get_it/get_it.dart';
import 'package:shared_libraries/shared_preferences/shared_preferences.dart';

class SharedLibrariesInjection {
  SharedLibrariesInjection();

  sharedPreferences() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(
      () => sharedPreferences,
    );
  }
}

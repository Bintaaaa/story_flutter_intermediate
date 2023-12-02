import 'package:authentication_core/di/authentication_injection.dart';
import 'package:shared_common/di/shared_common_injection.dart';
import 'package:shared_libraries/di/shared_libraries_injection.dart';

class Injections {
  initialize() {
    _shareds();
    _domain();
  }

  void _shareds() {
    SharedCommonInjection();
    SharedLibrariesInjection();
  }

  void _domain() {
    AuthenticationInjection();
  }
}

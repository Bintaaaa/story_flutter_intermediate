import 'package:shared_common/di/shared_common_injection.dart';
import 'package:shared_libraries/di/shared_libraries_injection.dart';

class Injections {
  initialize() {
    _shareds();
  }

  void _shareds() {
    SharedCommonInjection();
    SharedLibrariesInjection();
  }
}

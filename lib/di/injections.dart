import 'package:authentication_core/di/authentication_injection.dart';
import 'package:shared_common/di/shared_common_injection.dart';
import 'package:shared_libraries/di/shared_libraries_injection.dart';
import 'package:story_core/di/story_injection.dart';

class Injections {
  initialize() async {
    await _shareds();
    _domain();
  }

  Future<void> _shareds() async {
    SharedCommonInjection();
    await SharedLibrariesInjection().sharedPreferences();
  }

  void _domain() {
    AuthenticationInjection();
    StoryInjection();
  }
}

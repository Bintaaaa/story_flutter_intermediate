import 'package:shared_libraries/go_router/go_router.dart';

import 'navigation_routes.dart';

class NavigationConfig {
  GoRouter get navigation => _configRouter();

  GoRouter _configRouter() {
    return GoRouter(
      routes: NavigationRoutes().routes,
    );
  }
}

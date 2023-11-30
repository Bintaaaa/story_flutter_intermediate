import 'package:shared_libraries/go_router/go_router.dart';
import 'package:shared_navigation/config/navigation_redirect.dart';

import 'navigation_routes.dart';

class NavigationConfig {
  GoRouter get navigation => _configRouter();

  GoRouter _configRouter() {
    return GoRouter(
      routes: NavigationRoutes().routes,
      redirect: (context, state) => NavigationRedirect.navigationRedirect(
        context,
        state,
      ),
    );
  }
}

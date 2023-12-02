import 'package:shared_common/constans/constans_values.dart';
import 'package:shared_libraries/get_it/get_it.dart';
import 'package:shared_libraries/go_router/go_router.dart';
import 'package:shared_navigation/config/navigation_redirect.dart';

import 'navigation_routes.dart';

class NavigationConfig {
  GoRouter get navigation => _configRouter();
  GoRouter _configRouter() {
    return GoRouter(
      debugLogDiagnostics: true,
      routerNeglect: true,
      initialLocation: ConstansValue.routes.splashPath,
      routes: NavigationRoutes().routes,
      redirect: (context, state) async {
        final redirect = NavigationRedirect(
          context: context,
          goRouterState: state,
          getTokenUseCase: sl(),
        );
        return await redirect.redirect();
      },
    );
  }
}

import 'package:authentication_feature/screen/sign_in_screen.dart';
import 'package:onboarding_feature/screen/splash_screen.dart';
import 'package:shared_common/constans/constans_values.dart';
import 'package:shared_libraries/go_router/go_router.dart';

class NavigationRoutes {
  List<RouteBase> get routes => _routes();

  List<RouteBase> _routes() {
    return [
      GoRoute(
        path: "/",
        name: ConstansValue.routes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/auth/sign-in',
        name: ConstansValue.routes.signIn,
        builder: (context, state) => const SignInScreen(),
      ),
    ];
  }
}

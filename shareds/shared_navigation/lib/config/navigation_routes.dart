import 'package:authentication_feature/screen/sign_in_screen.dart';
import 'package:onboarding_feature/bloc/splash/splash_cubit.dart';
import 'package:onboarding_feature/screen/splash_screen.dart';
import 'package:shared_common/constans/constans_values.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/go_router/go_router.dart';

class NavigationRoutes {
  List<RouteBase> get routes => _routes();

  List<RouteBase> _routes() {
    return [
      GoRoute(
        path: ConstansValue.routes.splashPath,
        name: ConstansValue.routes.splashName,
        builder: (context, state) => BlocProvider<SplashCubit>(
          create: (context) => SplashCubit()..splashInit(),
          child: const SplashScreen(),
        ),
      ),
      GoRoute(
        path: ConstansValue.routes.signInPath,
        name: ConstansValue.routes.signInName,
        builder: (context, state) => const SignInScreen(),
      ),
    ];
  }
}

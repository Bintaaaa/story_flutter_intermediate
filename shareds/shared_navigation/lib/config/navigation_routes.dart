import 'package:authentication_feature/bloc/sig_in/sign_in_cubit.dart';
import 'package:authentication_feature/bloc/sig_out/sign_out_cubit.dart';
import 'package:authentication_feature/bloc/sign_up/sign_up_cubit.dart';
import 'package:authentication_feature/screen/optional_authentication_screen.dart';
import 'package:authentication_feature/screen/profile_screen.dart';
import 'package:authentication_feature/screen/sign_in_screen.dart';
import 'package:authentication_feature/screen/sign_up_screen.dart';
import 'package:onboarding_feature/bloc/splash/splash_cubit.dart';
import 'package:onboarding_feature/screen/splash_screen.dart';
import 'package:shared_common/constans/constans_values.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/get_it/get_it.dart';
import 'package:shared_libraries/go_router/go_router.dart';
import 'package:story_features/bloc/story_cubit.dart';
import 'package:story_features/screen/stories_screen.dart';
import 'package:story_features/screen/story_create_screen.dart';
import 'package:story_features/screen/story_detail_screen.dart';

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
        path: ConstansValue.routes.optionalAuthPath,
        name: ConstansValue.routes.optionalAuthName,
        builder: (context, state) => const OptionalAuthenticationScreen(),
      ),
      GoRoute(
        path: ConstansValue.routes.signUpPath,
        name: ConstansValue.routes.signUpName,
        builder: (context, state) => BlocProvider<SignUpCubit>(
          create: (context) => SignUpCubit(
            postRegisterUsecase: sl(),
          ),
          child: const SignUpScreen(),
        ),
      ),
      GoRoute(
        path: ConstansValue.routes.signInPath,
        name: ConstansValue.routes.signInName,
        builder: (context, state) => BlocProvider<SignInCubit>(
          create: (context) => SignInCubit(
            postSignInUseCase: sl(),
          ),
          child: SignInScreen(
            state: state,
          ),
        ),
      ),
      GoRoute(
        path: ConstansValue.routes.storiesPath,
        name: ConstansValue.routes.storiesName,
        builder: (context, state) => BlocProvider<StoryCubit>(
          create: (context) => StoryCubit(
            getStoriesUseCase: sl(),
            getStoryUseCase: sl(),
            postStoryUseCase: sl(),
          )..getStories(),
          child: const StoriesScreen(),
        ),
      ),
      GoRoute(
        path: ConstansValue.routes.storyPath,
        name: ConstansValue.routes.storyName,
        builder: (context, state) => BlocProvider<StoryCubit>(
          create: (context) => StoryCubit(
            getStoriesUseCase: sl(),
            getStoryUseCase: sl(),
            postStoryUseCase: sl(),
          )..getStory(
              state.pathParameters["id"]!,
            ),
          child: const StoryDetailScreen(),
        ),
      ),
      GoRoute(
        path: ConstansValue.routes.createStoriesPath,
        name: ConstansValue.routes.createStoriesName,
        builder: (context, state) => BlocProvider<StoryCubit>(
          create: (context) => StoryCubit(
            getStoriesUseCase: sl(),
            getStoryUseCase: sl(),
            postStoryUseCase: sl(),
          ),
          child: StoryCreateScreen(
            bloc: state.extra as StoryCubit,
          ),
        ),
      ),
      GoRoute(
        path: ConstansValue.routes.profilePath,
        name: ConstansValue.routes.profileName,
        builder: (context, state) => BlocProvider(
          create: (context) => SignOutCubit(
            removeTokenUseCase: sl(),
          ),
          child: const ProfileScreen(),
        ),
      ),
    ];
  }
}

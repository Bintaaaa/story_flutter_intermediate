import 'package:flutter/material.dart';
import 'package:onboarding_feature/bloc/splash/splash_cubit.dart';
import 'package:onboarding_feature/bloc/splash/splash_state.dart';
import 'package:shared_common/states/view_data_state.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          final status = state.splashState.status;
          if (status.isNoData) {
            context.go('/auth/sign-in');
          }
        },
        child: SafeArea(
          child: Center(
            child: TextButton(
              onPressed: () {
                context.go(
                  '/auth/sign-in',
                );
              },
              child: Text("Splash Screen"),
            ),
          ),
        ),
      ),
    );
  }
}

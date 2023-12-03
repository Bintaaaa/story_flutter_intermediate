import 'dart:developer';

import 'package:authentication_core/domain/usecases/get_token_usecase.dart';
import 'package:flutter/material.dart';
import 'package:shared_common/constans/constans_values.dart';
import 'package:shared_common/usecase/usecase.dart';
import 'package:shared_libraries/go_router/go_router.dart';

class NavigationRedirect {
  final BuildContext context;
  final GoRouterState goRouterState;
  final GetTokenUseCase getTokenUseCase;

  NavigationRedirect({
    required this.context,
    required this.goRouterState,
    required this.getTokenUseCase,
  });

  Future<String?> redirect() async {
    final resultLogin = await getTokenUseCase.call(
      const NoParams(),
    );
    String? path;
    String currentPath = goRouterState.fullPath!;
    log("Now Current path $currentPath");

    resultLogin.fold((failure) {}, (data) {
      log("Token User is $data");

      path = _guard(
        currentPath,
        data.isNotEmpty,
      );
    });

    return path;
  }

  String? _guard(String currentPath, bool isLoggedIn) {
    String? path;
    final List<String> needTokenLogin = [
      ConstansValue.routes.storiesPath,
      ConstansValue.routes.createStoriesPath,
      ConstansValue.routes.storyPath,
    ];
    final List<String> unneededTokenLogin = [
      ConstansValue.routes.optionalAuthPath,
      ConstansValue.routes.signInPath,
      ConstansValue.routes.signUpPath,
    ];
    if (isLoggedIn) {
      log("is Login");
      for (int i = 0; i < unneededTokenLogin.length; i++) {
        if (currentPath == unneededTokenLogin[i]) {
          log("is Login");
          path = ConstansValue.routes.storiesPath;
        }
      }
    } else {
      log("is not Login");

      for (int i = 0; i < needTokenLogin.length; i++) {
        if (currentPath == needTokenLogin[i]) {
          path = ConstansValue.routes.optionalAuthPath;
          break;
        }
      }
    }
    return path;
  }
}

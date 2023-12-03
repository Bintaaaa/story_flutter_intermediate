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
    String? path;
    String currentPath = goRouterState.fullPath!;
    final resultLogin = await getTokenUseCase.call(
      const NoParams(),
    );
    resultLogin.fold((failure) {}, (data) {
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
    ];
    final List<String> unneededTokenLogin = [
      ConstansValue.routes.optionalAuthPath,
      ConstansValue.routes.signInPath,
      ConstansValue.routes.signUpPath,
    ];
    for (int i = 0; i < needTokenLogin.length; i++) {
      if (currentPath == needTokenLogin[i] && !isLoggedIn) {
        path = ConstansValue.routes.optionalAuthPath;
        break;
      }
    }
    for (int i = 0; i < unneededTokenLogin.length; i++) {
      if (currentPath == unneededTokenLogin[i] && isLoggedIn) {
        path = ConstansValue.routes.storiesPath;
      }
    }
    return path;
  }
}

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
    String? path;
    final resultLogin = await getTokenUseCase.call(
      const NoParams(),
    );

    if (goRouterState.fullPath == ConstansValue.routes.optionalAuthPath) {
      resultLogin.fold((failure) {}, (data) {
        if (data.isNotEmpty) {
          path = ConstansValue.routes.storiesPath;
        }
      });
    }
    return path;
  }
}

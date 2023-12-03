import 'package:flutter/material.dart';
import 'package:shared_common/constans/constans_values.dart';
import 'package:shared_component/button/button_filled_component.dart';
import 'package:shared_libraries/go_router/go_router.dart';
import 'package:shared_libraries/intl/app_localizations.dart';

class OptionalAuthenticationScreen extends StatelessWidget {
  const OptionalAuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(
            16.0,
          ),
          child: ListView(
            children: [
              ButtonFilledComponent(
                onPressed: () {
                  context.pushNamed(
                    ConstansValue.routes.signInName,
                  );
                },
                title: AppLocalizations.of(context)!.buttonLogin,
              ),
              ButtonFilledComponent(
                onPressed: () {
                  context.pushNamed(
                    ConstansValue.routes.signUpName,
                  );
                },
                title: AppLocalizations.of(context)!.buttonRegister,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

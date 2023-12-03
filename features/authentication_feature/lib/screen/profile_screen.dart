import 'package:authentication_feature/bloc/sig_out/sign_out_cubit.dart';
import 'package:flutter/material.dart';
import 'package:shared_common/constans/constans_values.dart';
import 'package:shared_component/button/button_filled_component.dart';
import 'package:shared_libraries/app_settings/app_settings.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/go_router/go_router.dart';
import 'package:shared_libraries/intl/app_localizations.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.settingsAppBar,
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(
            16.0,
          ),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  AppSettings.openAppSettings();
                },
                child: SizedBox(
                  height: 55,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.openSettings,
                        style: const TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.open,
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              ButtonFilledComponent(
                onPressed: () {
                  context.read<SignOutCubit>().signOut();
                  context.goNamed(
                    ConstansValue.routes.optionalAuthName,
                  );
                },
                title: AppLocalizations.of(context)!.logout,
              ),
              const SizedBox.square(
                dimension: 16.0,
              ),
              const Text(
                "©Bijantyum",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

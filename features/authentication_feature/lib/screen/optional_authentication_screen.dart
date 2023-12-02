import 'package:flutter/material.dart';
import 'package:shared_common/constans/constans_values.dart';
import 'package:shared_libraries/go_router/go_router.dart';

class OptionalAuthenticationScreen extends StatelessWidget {
  const OptionalAuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              "Login",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed(
                ConstansValue.routes.signUpName,
              );
            },
            child: const Text(
              "Register",
            ),
          ),
        ],
      ),
    );
  }
}

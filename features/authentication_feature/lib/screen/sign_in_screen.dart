import 'package:flutter/material.dart';
import 'package:shared_component/text_field/text_field_component.dart';
import 'package:shared_libraries/go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  final GoRouterState state;

  const SignInScreen({
    super.key,
    required this.state,
  });

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController(
      text: widget.state.uri.queryParameters["email"] ?? "",
    );
    passwordController = TextEditingController(
      text: widget.state.uri.queryParameters["password"] ?? "",
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

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
              TextFieldComponent(
                controller: emailController,
                label: "Email",
              ),
              const SizedBox.square(
                dimension: 16.0,
              ),
              TextFieldComponent(
                controller: passwordController,
                label: "password",
              )
            ],
          ),
        ),
      ),
    );
  }
}

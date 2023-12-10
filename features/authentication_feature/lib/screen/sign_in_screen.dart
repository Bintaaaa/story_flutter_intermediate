import 'package:authentication_feature/bloc/sig_in/sign_in_cubit.dart';
import 'package:authentication_feature/bloc/sig_in/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:shared_common/constans/constans_values.dart';
import 'package:shared_common/states/view_data_state.dart';
import 'package:shared_component/button/button_filled_component.dart';
import 'package:shared_component/text_field/text_field_component.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/go_router/go_router.dart';
import 'package:shared_libraries/intl/app_localizations.dart';

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
      appBar: AppBar(
        title: const Text(
          "Sign In",
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(
            16.0,
          ),
          child: BlocConsumer<SignInCubit, SignInState>(
            listener: (context, state) {
              final status = state.signInState.status;
              if (status.isError) {
                final errorMessage = state.signInState.message;
                final snackBar = SnackBar(
                  content: Text(errorMessage),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else if (status.isHasData) {
                context.goNamed(
                  ConstansValue.routes.storiesName,
                );
              }
            },
            builder: (context, state) {
              final status = state.signInState.status;
              return ListView(
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
                    isObscureText: true,
                    label: "password",
                  ),
                  const SizedBox.square(
                    dimension: 58.0,
                  ),
                  ButtonFilledComponent(
                    onPressed: () {
                      context.read<SignInCubit>().signIn(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                    },
                    isLoading: status.isLoading,
                    title: AppLocalizations.of(context)!.buttonLogin,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

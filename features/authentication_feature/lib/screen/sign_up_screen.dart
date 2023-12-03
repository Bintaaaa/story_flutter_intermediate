import 'package:authentication_feature/bloc/sign_up/sign_up_cubit.dart';
import 'package:authentication_feature/bloc/sign_up/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:shared_common/constans/constans_values.dart';
import 'package:shared_common/states/view_data_state.dart';
import 'package:shared_component/button/button_filled_component.dart';
import 'package:shared_component/text_field/text_field_component.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController(text: "");
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController passwordController = TextEditingController(text: "");

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Registration Account",
        ),
      ),
      body: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          final status = state.signUpState.status;
          if (status.isError) {
            final errorMessage = state.signUpState.message;
            final snackBar = SnackBar(
              content: Text(errorMessage),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else if (status.isHasData) {
            context.pushReplacementNamed(
              ConstansValue.routes.signInName,
              queryParameters: {
                "email": emailController.text,
                "password": passwordController.text,
              },
            );
          }
        },
        builder: (context, state) {
          final status = state.signUpState.status;
          return SafeArea(
            child: Container(
              margin: const EdgeInsets.all(
                16.0,
              ),
              child: ListView(
                children: [
                  TextFieldComponent(
                    controller: nameController,
                    label: "Name",
                  ),
                  const SizedBox.square(
                    dimension: 16.0,
                  ),
                  TextFieldComponent(
                    controller: emailController,
                    label: "Email",
                  ),
                  const SizedBox.square(
                    dimension: 16.0,
                  ),
                  TextFieldComponent(
                    controller: passwordController,
                    label: "Password",
                  ),
                  const SizedBox.square(
                    dimension: 58.0,
                  ),
                  ButtonFilledComponent(
                    onPressed: () {
                      context.read<SignUpCubit>().signUp(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                          );
                    },
                    isLoading: status.isLoading,
                    title: "Register",
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

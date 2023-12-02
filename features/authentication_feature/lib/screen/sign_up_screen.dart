import 'package:authentication_feature/bloc/sign_up/sign_up_cubit.dart';
import 'package:authentication_feature/bloc/sign_up/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:shared_common/states/view_data_state.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          final status = state.signUpState.status;
          if (status.isError) {
            final errorMessage = state.signUpState.message;
            final snackBar = SnackBar(
              content: Text(errorMessage),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              context.read<SignUpCubit>().signUp(
                    name: "Ronal",
                    email: "ronaldo1@ronaldo.com",
                    password: "1234568",
                  );
            },
            child: const Text("Kirim"),
          ),
        ),
      ),
    );
  }
}

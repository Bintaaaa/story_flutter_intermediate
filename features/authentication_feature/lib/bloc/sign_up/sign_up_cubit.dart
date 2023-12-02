import 'dart:developer';

import 'package:authentication_core/domain/entities/register_body_entity.dart';
import 'package:authentication_core/domain/usecases/post_register_usecase.dart';
import 'package:authentication_feature/bloc/sign_up/sign_up_state.dart';
import 'package:shared_common/error/failure_response.dart';
import 'package:shared_common/states/view_data_state.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final PostRegisterUsecase postRegisterUsecase;

  SignUpCubit({
    required this.postRegisterUsecase,
  }) : super(
          SignUpState(
            signUpState: ViewData.initial(),
          ),
        );

  signUp({required String name, required String email, required String password}) async {
    log("Name : $name, email: $email, password: $password,");
    final result = await postRegisterUsecase.call(
      RegisterBodyEntity(
        email: email,
        password: password,
        name: name,
      ),
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          signUpState: ViewData.error(
            message: failure.errorMessage,
            failureResponse: FailureResponse(
              errorMessage: failure.errorMessage,
            ),
          ),
        ),
      ),
      (data) => emit(
        state.copyWith(
          signUpState: ViewData.loaded(
            data: data,
          ),
        ),
      ),
    );
  }
}

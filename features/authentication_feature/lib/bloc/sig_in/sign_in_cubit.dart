import 'package:authentication_core/domain/entities/sign_in_body_entity.dart';
import 'package:authentication_core/domain/usecases/post_sign_in_usecase.dart';
import 'package:authentication_feature/bloc/sig_in/sign_in_state.dart';
import 'package:shared_common/states/view_data_state.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInState> {
  final PostSignInUseCase postSignInUseCase;

  SignInCubit({
    required this.postSignInUseCase,
  }) : super(
          SignInState(
            signInState: ViewData.initial(),
          ),
        );

  signIn({
    required String email,
    required String password,
  }) async {
    emit(
      state.copyWith(
        signInState: ViewData.loading(),
      ),
    );
    final result = await postSignInUseCase.call(
      SignInBodyEntity(
        email: email,
        password: password,
      ),
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          signInState: ViewData.error(
            message: failure.errorMessage!,
          ),
        ),
      ),
      (data) => emit(
        state.copyWith(
          signInState: ViewData.loaded(
            data: data,
          ),
        ),
      ),
    );
  }
}

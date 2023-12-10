import 'package:authentication_core/domain/usecases/remove_token_usecase.dart';
import 'package:authentication_feature/bloc/sig_out/sign_out_state.dart';
import 'package:shared_common/states/view_data_state.dart';
import 'package:shared_common/usecase/usecase.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';

class SignOutCubit extends Cubit<SignOutState> {
  final RemoveTokenUseCase removeTokenUseCase;

  SignOutCubit({
    required this.removeTokenUseCase,
  }) : super(
          SignOutState(
            signOutState: ViewData.initial(),
          ),
        );

  Future<void> signOut() async {
    emit(
      state.copyWith(
        signOutState: ViewData.loading(),
      ),
    );
    final result = await removeTokenUseCase.call(
      const NoParams(),
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          signOutState: ViewData.error(
            message: failure.errorMessage!,
          ),
        ),
      ),
      (data) => emit(
        state.copyWith(
          signOutState: ViewData.loaded(
            data: data,
          ),
        ),
      ),
    );
  }
}

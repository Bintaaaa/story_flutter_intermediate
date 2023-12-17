import 'package:authentication_core/domain/entities/sign_in_response_entity.dart';
import 'package:shared_common/states/view_data_state.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class SignInState extends Equatable {
  final ViewData<SignInResponseEntity> signInState;

  const SignInState({
    required this.signInState,
  });

  SignInState copyWith({ViewData<SignInResponseEntity>? signInState}) =>
      SignInState(
        signInState: signInState ?? this.signInState,
      );

  @override
  List<Object?> get props => [
        signInState,
      ];
}

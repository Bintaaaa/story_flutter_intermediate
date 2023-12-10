import 'package:authentication_core/domain/entities/register_response_entity.dart';
import 'package:shared_common/states/view_data_state.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class SignUpState extends Equatable {
  final ViewData<RegisterResponseEntity> signUpState;

  const SignUpState({
    required this.signUpState,
  });

  SignUpState copyWith({ViewData<RegisterResponseEntity>? signUpState}) => SignUpState(
        signUpState: signUpState ?? this.signUpState,
      );

  @override
  List<Object?> get props => [
        signUpState,
      ];
}

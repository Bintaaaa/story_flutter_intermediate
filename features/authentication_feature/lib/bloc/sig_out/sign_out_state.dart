import 'package:shared_common/states/view_data_state.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class SignOutState extends Equatable {
  final ViewData<bool> signOutState;

  const SignOutState({
    required this.signOutState,
  });

  SignOutState copyWith({ViewData<bool>? signOutState}) => SignOutState(
        signOutState: signOutState ?? this.signOutState,
      );

  @override
  List<Object?> get props => [
        signOutState,
      ];
}

import 'package:shared_common/states/view_data_state.dart';
import 'package:shared_libraries/equatable/equatable.dart';

class SplashState extends Equatable {
  final ViewData splashState;
  const SplashState({
    required this.splashState,
  });

  SplashState copyWith({ViewData? splashState}) => SplashState(
        splashState: splashState ?? this.splashState,
      );

  @override
  List<Object> get props => [
        splashState,
      ];
}

import 'package:onboarding_feature/bloc/splash/splash_state.dart';
import 'package:shared_common/states/view_data_state.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit()
      : super(
          SplashState(
            splashState: ViewData.initial(),
          ),
        );

  void splashInit() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    emit(
      state.copyWith(
        splashState: ViewData.noData(
          message: "",
        ),
      ),
    );
  }
}

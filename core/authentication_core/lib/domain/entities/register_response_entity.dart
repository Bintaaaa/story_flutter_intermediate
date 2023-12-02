import 'package:shared_libraries/equatable/equatable.dart';

class RegisterResponseEntity extends Equatable {
  final bool isSuccess;

  const RegisterResponseEntity({
    required this.isSuccess,
  });
  @override
  List<Object?> get props => [
        isSuccess,
      ];
}

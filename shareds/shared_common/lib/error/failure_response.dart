import 'package:shared_libraries/equatable/equatable.dart';

class FailureResponse extends Equatable {
  final String errorMessage;
  final int? statusCode;

  const FailureResponse({
    required this.errorMessage,
    this.statusCode,
  });

  @override
  List<Object?> get props => [
        errorMessage,
        statusCode,
      ];
}

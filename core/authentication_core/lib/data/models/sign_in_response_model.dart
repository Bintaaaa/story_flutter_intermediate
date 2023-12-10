import 'package:json_annotation/json_annotation.dart';

part 'sign_in_response_model.g.dart';

@JsonSerializable()
class SignInResponseModel {
  final bool? error;
  final String? message;
  final SignInResultResponseModel? loginResult;

  SignInResponseModel({
    this.error,
    this.message,
    this.loginResult,
  });

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) => _$SignInResponseModelFromJson(json);
}

@JsonSerializable()
class SignInResultResponseModel {
  final String? userId;
  final String? name;
  final String? token;

  SignInResultResponseModel({
    this.userId,
    this.name,
    this.token,
  });

  factory SignInResultResponseModel.fromJson(Map<String, dynamic> json) => _$SignInResultResponseModelFromJson(json);
}

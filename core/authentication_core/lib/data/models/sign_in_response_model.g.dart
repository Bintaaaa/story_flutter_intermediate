// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInResponseModel _$SignInResponseModelFromJson(Map<String, dynamic> json) =>
    SignInResponseModel(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      loginResult: json['loginResult'] == null
          ? null
          : SignInResultResponseModel.fromJson(
              json['loginResult'] as Map<String, dynamic>),
    );

SignInResultResponseModel _$SignInResultResponseModelFromJson(
        Map<String, dynamic> json) =>
    SignInResultResponseModel(
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      token: json['token'] as String?,
    );

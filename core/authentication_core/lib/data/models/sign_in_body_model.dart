import 'package:json_annotation/json_annotation.dart';

part 'sign_in_body_model.g.dart';

@JsonSerializable()
class SignInBodyModel {
  final String email;
  final String password;

  const SignInBodyModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$SignInBodyModelToJson(this);
}

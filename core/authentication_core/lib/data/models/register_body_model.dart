import 'package:json_annotation/json_annotation.dart';

part 'register_body_model.g.dart';

@JsonSerializable()
class RegisterBodyModel {
  final String name;
  final String email;
  final String password;

  const RegisterBodyModel({
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$RegisterBodyModelToJson(this);
}

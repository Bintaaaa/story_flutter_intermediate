class SignInBodyModel {
  final String email;
  final String password;

  const SignInBodyModel({
    required this.email,
    required this.password,
  });

  toJson() => {
        "email": email,
        "password": password,
      };
}

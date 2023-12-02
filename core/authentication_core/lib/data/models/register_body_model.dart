class RegisterBodyModel {
  final String name;
  final String email;
  final String password;

  const RegisterBodyModel({
    required this.name,
    required this.email,
    required this.password,
  });

  toJson() => {
        "name": name,
        "email": email,
        "password": password,
      };
}

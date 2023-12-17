class RegisterBodyEntity {
  final String name;
  final String email;
  final String password;

  const RegisterBodyEntity({
    required this.email,
    required this.password,
    required this.name,
  });
}

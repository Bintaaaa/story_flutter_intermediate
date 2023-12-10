class SignInResponseEntity {
  final bool error;
  final String message;
  final SignInResultResponseEntity loginResult;

  SignInResponseEntity({
    required this.error,
    required this.message,
    required this.loginResult,
  });
}

class SignInResultResponseEntity {
  final String userId;
  final String name;
  final String token;

  SignInResultResponseEntity({
    required this.userId,
    required this.name,
    required this.token,
  });
}

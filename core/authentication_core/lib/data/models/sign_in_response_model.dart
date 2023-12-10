class SignInResponseModel {
  final bool? error;
  final String? message;
  final SignInResultResponseModel? loginResult;

  SignInResponseModel({
    this.error,
    this.message,
    this.loginResult,
  });

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) => SignInResponseModel(
        error: json["error"],
        message: json["message"],
        loginResult: SignInResultResponseModel.fromJson(
          json["loginResult"],
        ),
      );
}

class SignInResultResponseModel {
  final String? userId;
  final String? name;
  final String? token;

  SignInResultResponseModel({
    this.userId,
    this.name,
    this.token,
  });

  factory SignInResultResponseModel.fromJson(Map<String, dynamic> json) => SignInResultResponseModel(
        userId: json["userId"],
        name: json["name"],
        token: json["token"],
      );
}

class GeneralResponseModel {
  final bool? error;
  final String? message;

  const GeneralResponseModel({
    this.error,
    this.message,
  });

  factory GeneralResponseModel.fromJson(Map<String, dynamic> json) => GeneralResponseModel(
        error: json["error"],
        message: json["message"],
      );
}

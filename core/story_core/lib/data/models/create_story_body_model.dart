import 'package:shared_libraries/dio/dio.dart';

class CreateStoryBodyModel {
  final String description;
  final String filePath;

  const CreateStoryBodyModel({
    required this.description,
    required this.filePath,
  });

  Future<FormData> toFormData() async => FormData.fromMap(
        {
          "description": description,
          "photo": await MultipartFile.fromFile(
            filePath,
            filename: "photo.jpg",
          ),
        },
      );
}

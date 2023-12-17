import 'package:shared_libraries/dio/dio.dart';

class CreateStoryBodyModel {
  final String description;
  final String filePath;
  final double? lat;
  final double? lng;

  const CreateStoryBodyModel({
    required this.description,
    required this.filePath,
    this.lat,
    this.lng,
  });

  Future<FormData> toFormData() async => lat == null
      ? FormData.fromMap(
          {
            "description": description,
            "photo": await MultipartFile.fromFile(
              filePath,
              filename: "photo.jpg",
            ),
          },
        )
      : FormData.fromMap(
          {
            "description": description,
            "lat": lat,
            "lon": lng,
            "photo": await MultipartFile.fromFile(
              filePath,
              filename: "photo.jpg",
            ),
          },
        );
}

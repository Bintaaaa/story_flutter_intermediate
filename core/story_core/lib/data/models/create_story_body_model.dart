import 'package:shared_libraries/dio/dio.dart';

class CreateStoryBodyModel {
  final String description;
  final List<int> photoBytes;
  final double? latitude;
  final double? longitude;

  const CreateStoryBodyModel({
    required this.description,
    required this.photoBytes,
    this.latitude,
    this.longitude,
  });

  toFormData() => FormData.fromMap(
        {
          "description": description,
          "photo": MultipartFile.fromBytes(
            photoBytes,
            filename: 'temp_name.jpg',
          ),
          "lat": latitude,
          "lon": longitude,
        },
      );
}

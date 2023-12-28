import 'dart:io';

class CreateStoryBodyEntity {
  final String description;
  final File? file;
  final double? lat;
  final double? lng;

  const CreateStoryBodyEntity({
    required this.description,
    this.file,
    this.lat,
    this.lng,
  });
}

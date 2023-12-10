import 'dart:io';

class CreateStoryBodyEntity {
  final String description;
  final File? file;

  const CreateStoryBodyEntity({
    required this.description,
    this.file,
  });
}

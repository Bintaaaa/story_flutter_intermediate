class CreateStoryBodyEntity {
  final String description;
  final List<int> photoBytes;

  const CreateStoryBodyEntity({
    required this.description,
    required this.photoBytes,
  });
}

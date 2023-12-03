import 'package:story_core/domains/entities/story_response_entity.dart';

class StoriesResponseEntity {
  final bool error;
  final String message;
  final List<StoryResponseEntity> listStory;

  const StoriesResponseEntity({
    required this.error,
    required this.message,
    required this.listStory,
  });
}

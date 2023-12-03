import 'package:story_core/data/models/story_item_response_model.dart';

class StoryResponseEntity {
  final bool error;
  final String message;
  final StoryItemResponseModel story;

  const StoryResponseEntity({
    required this.error,
    required this.message,
    required this.story,
  });
}

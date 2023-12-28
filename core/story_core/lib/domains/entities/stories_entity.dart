import 'package:shared_libraries/equatable/equatable.dart';
import 'package:story_core/domains/entities/story_item_response_entity.dart';

class StoriesEntity extends Equatable {
  final List<StoryItemResponseEntity> listStories;
  final String message;

  const StoriesEntity({
    required this.listStories,
    required this.message,
  });

  @override
  List<Object?> get props => [
        listStories,
        message,
      ];
}

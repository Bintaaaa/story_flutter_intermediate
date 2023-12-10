import 'dart:io';

import 'package:shared_common/states/view_data_state.dart';
import 'package:shared_libraries/equatable/equatable.dart';
import 'package:story_core/domains/entities/create_story_response_entity.dart';
import 'package:story_core/domains/entities/story_item_response_entity.dart';
import 'package:story_core/domains/entities/story_response_entity.dart';

class StoryState extends Equatable {
  final ViewData<List<StoryItemResponseEntity>> stateStories;
  final ViewData<StoryResponseEntity> stateStory;
  final ViewData<CreateStoryResponseEntity> stateCreateStory;
  final ViewData<File> stateImage;

  const StoryState({
    required this.stateStories,
    required this.stateStory,
    required this.stateCreateStory,
    required this.stateImage,
  });

  StoryState copyWith({
    ViewData<List<StoryItemResponseEntity>>? stateStories,
    ViewData<StoryResponseEntity>? stateStory,
    ViewData<CreateStoryResponseEntity>? stateCreateStory,
    final ViewData<File>? stateImage,
  }) =>
      StoryState(
        stateStories: stateStories ?? this.stateStories,
        stateStory: stateStory ?? this.stateStory,
        stateCreateStory: stateCreateStory ?? this.stateCreateStory,
        stateImage: stateImage ?? this.stateImage,
      );

  @override
  List<Object?> get props => [
        stateStories,
        stateStory,
        stateCreateStory,
        stateImage,
      ];
}

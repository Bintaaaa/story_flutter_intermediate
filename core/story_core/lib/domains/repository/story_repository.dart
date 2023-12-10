import 'package:shared_common/error/failure_response.dart';
import 'package:shared_libraries/dartz/dartz.dart';
import 'package:story_core/domains/entities/create_story_body_entity.dart';
import 'package:story_core/domains/entities/create_story_response_entity.dart';
import 'package:story_core/domains/entities/story_item_response_entity.dart';
import 'package:story_core/domains/entities/story_response_entity.dart';

abstract class StoryRepository {
  Future<Either<FailureResponse, List<StoryItemResponseEntity>>> getStories({int page = 1});
  Future<Either<FailureResponse, StoryResponseEntity>> getStory(String id);
  Future<Either<FailureResponse, CreateStoryResponseEntity>> createStory({
    required CreateStoryBodyEntity data,
  });
}

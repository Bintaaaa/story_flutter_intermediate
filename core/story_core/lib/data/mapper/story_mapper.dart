import 'package:shared_common/models/general_response_model.dart';
import 'package:story_core/data/models/create_story_body_model.dart';
import 'package:story_core/data/models/stories_response_model.dart';
import 'package:story_core/data/models/story_response_model.dart';
import 'package:story_core/domains/entities/create_story_body_entity.dart';
import 'package:story_core/domains/entities/create_story_response_entity.dart';
import 'package:story_core/domains/entities/stories_response_entity.dart';
import 'package:story_core/domains/entities/story_response_entity.dart';

class StoryMapper {
  const StoryMapper();

  StoriesResponseEntity storiesResponseModelToEntity(StoriesResponseModel data) => StoriesResponseEntity(
        error: data.error ?? true,
        message: data.message ?? "Error",
        listStory: storiesListResponseModelToEntity(
          data.listStory ?? [],
        ),
      );
  List<StoryResponseEntity> storiesListResponseModelToEntity(List<StoryResponseModel> data) {
    List<StoryResponseEntity> newData = [];
    for (var element in data) {
      newData.add(
        StoryResponseEntity(
          id: element.id ?? "story-id-null",
          name: element.name ?? "Name Not Found",
          description: element.description ?? "Description Not FOUND",
          photoUrl: element.photoUrl ?? "URL NOT FOUND",
          createdAt: element.createdAt ?? "000000",
          lat: element.lat ?? 000,
          lon: element.lon ?? 000,
        ),
      );
    }
    return newData;
  }

  StoryResponseEntity storyResponseModelToEntity(StoryResponseModel data) => StoryResponseEntity(
        id: data.id ?? "story-id-null",
        name: data.name ?? "Name Not Found",
        description: data.description ?? "Description Not FOUND",
        photoUrl: data.photoUrl ?? "URL NOT FOUND",
        createdAt: data.createdAt ?? "000000",
        lat: data.lat ?? 000,
        lon: data.lon ?? 000,
      );

  CreateStoryBodyModel createStoryEntityToModel(CreateStoryBodyEntity data) => CreateStoryBodyModel(
        description: data.description,
        photoBytes: data.photoBytes,
      );

  CreateStoryResponseEntity createStoryResponseModelToEntity(GeneralResponseModel data) => CreateStoryResponseEntity(
        isSuccess: !(data.error ?? true),
      );
}

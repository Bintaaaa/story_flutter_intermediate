import 'package:shared_common/constans/constans_values.dart';
import 'package:shared_common/models/general_response_model.dart';
import 'package:shared_libraries/dio/dio.dart';
import 'package:story_core/data/models/create_story_body_model.dart';
import 'package:story_core/data/models/stories_response_model.dart';
import 'package:story_core/data/models/story_response_model.dart';

abstract class StoriesRemoteDatasource {
  Future<StoriesResponseModel> getStories();
  Future<StoryResponseModel> getStory(String id);
  Future<GeneralResponseModel> createStory({required CreateStoryBodyModel data});
}

class StoriesRemoteDatasourceImpl implements StoriesRemoteDatasource {
  final Dio dio;
  const StoriesRemoteDatasourceImpl({required this.dio});
  @override
  Future<StoriesResponseModel> getStories() async {
    try {
      final response = await dio.get(
        ConstansValue.network.stories,
      );
      return StoriesResponseModel.fromJson(
        response.data,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<StoryResponseModel> getStory(String id) async {
    try {
      final response = await dio.get(
        "${ConstansValue.network.stories}/$id",
      );

      return StoryResponseModel.fromJson(
        response.data,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<GeneralResponseModel> createStory({required CreateStoryBodyModel data}) async {
    try {
      final response = await dio.post(
        ConstansValue.network.stories,
        data: data.toFormData(),
      );

      return GeneralResponseModel.fromJson(
        response.data,
      );
    } catch (e) {
      rethrow;
    }
  }
}

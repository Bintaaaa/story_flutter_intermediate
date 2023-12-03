import 'package:shared_common/error/failure_response.dart';
import 'package:shared_libraries/dartz/dartz.dart';
import 'package:shared_libraries/dio/dio.dart';
import 'package:story_core/data/datasources/remote/stories_remote_datasource.dart';
import 'package:story_core/data/mapper/story_mapper.dart';
import 'package:story_core/domains/entities/create_story_body_entity.dart';
import 'package:story_core/domains/entities/create_story_response_entity.dart';
import 'package:story_core/domains/entities/stories_response_entity.dart';
import 'package:story_core/domains/entities/story_response_entity.dart';
import 'package:story_core/domains/repository/story_repository.dart';

class StoryRepositoryImpl implements StoryRepository {
  final StoriesRemoteDatasource storiesRemoteDatasource;
  final StoryMapper storyMapper;

  StoryRepositoryImpl({
    required this.storiesRemoteDatasource,
    required this.storyMapper,
  });

  @override
  Future<Either<FailureResponse, CreateStoryResponseEntity>> createStory({required CreateStoryBodyEntity data}) async {
    try {
      final response = await storiesRemoteDatasource.createStory(
        data: storyMapper.createStoryEntityToModel(
          data,
        ),
      );
      return Right(
        storyMapper.createStoryResponseModelToEntity(
          response,
        ),
      );
    } on DioException catch (error) {
      return Left(
        FailureResponse(
          dioException: error,
        ),
      );
    }
  }

  @override
  Future<Either<FailureResponse, StoriesResponseEntity>> getStories() async {
    try {
      final response = await storiesRemoteDatasource.getStories();

      return Right(
        storyMapper.storiesResponseModelToEntity(
          response,
        ),
      );
    } on DioException catch (error) {
      return Left(
        FailureResponse(
          dioException: error,
        ),
      );
    }
  }

  @override
  Future<Either<FailureResponse, StoryResponseEntity>> getStory(String id) async {
    try {
      final response = await storiesRemoteDatasource.getStory(
        id,
      );
      return Right(
        storyMapper.storyResponseModelToEntity(
          response,
        ),
      );
    } on DioException catch (error) {
      return Left(
        FailureResponse(
          dioException: error,
        ),
      );
    }
  }
}

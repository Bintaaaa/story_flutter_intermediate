import 'package:shared_common/error/failure_response.dart';
import 'package:shared_common/usecase/usecase.dart';
import 'package:shared_libraries/dartz/dartz.dart';
import 'package:story_core/domains/entities/story_response_entity.dart';
import 'package:story_core/domains/repository/story_repository.dart';

class GetStoryUseCase extends UseCase<StoryResponseEntity, String> {
  final StoryRepository storyRepository;

  GetStoryUseCase({
    required this.storyRepository,
  });

  @override
  Future<Either<FailureResponse, StoryResponseEntity>> call(
          String parameter) async =>
      await storyRepository.getStory(
        parameter,
      );
}

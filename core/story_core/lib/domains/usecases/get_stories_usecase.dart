import 'package:shared_common/error/failure_response.dart';
import 'package:shared_common/usecase/usecase.dart';
import 'package:shared_libraries/dartz/dartz.dart';
import 'package:story_core/domains/entities/stories_response_entity.dart';
import 'package:story_core/domains/repository/story_repository.dart';

class GetStoriesUseCase extends UseCase<StoriesResponseEntity, NoParams> {
  final StoryRepository storyRepository;

  GetStoriesUseCase({
    required this.storyRepository,
  });

  @override
  Future<Either<FailureResponse, StoriesResponseEntity>> call(NoParams parameter) async =>
      await storyRepository.getStories();
}

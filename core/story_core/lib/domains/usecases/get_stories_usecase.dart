import 'package:shared_common/error/failure_response.dart';
import 'package:shared_common/usecase/usecase.dart';
import 'package:shared_libraries/dartz/dartz.dart';
import 'package:story_core/domains/entities/story_item_response_entity.dart';
import 'package:story_core/domains/repository/story_repository.dart';

class GetStoriesUseCase extends UseCase<List<StoryItemResponseEntity>, int> {
  final StoryRepository storyRepository;
  int page = 1;
  List<StoryItemResponseEntity> newEntity = [];

  GetStoriesUseCase({
    required this.storyRepository,
  });

  @override
  Future<Either<FailureResponse, List<StoryItemResponseEntity>>> call(int parameter) async {
    page = parameter == 1
        ? 1
        : parameter == 0
            ? page
            : parameter;
    print("ini adalah nilai dari $page");
    final result = await storyRepository.getStories(
      page: page,
    );
    return result.fold(
      (failure) => Left(
        FailureResponse(
          errorMessage: failure.errorMessage,
        ),
      ),
      (data) {
        newEntity.addAll(data);
        page++;
        return Right(
          newEntity,
        );
      },
    );
  }
}

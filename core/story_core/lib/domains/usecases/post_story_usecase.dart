import 'package:shared_common/error/failure_response.dart';
import 'package:shared_common/usecase/usecase.dart';
import 'package:shared_common/utilities/utilitites_checking_value.dart';
import 'package:shared_libraries/dartz/dartz.dart';
import 'package:story_core/domains/entities/create_story_body_entity.dart';
import 'package:story_core/domains/entities/create_story_response_entity.dart';
import 'package:story_core/domains/repository/story_repository.dart';

class PostStoryUseCase
    extends UseCase<CreateStoryResponseEntity, CreateStoryBodyEntity> {
  final StoryRepository storyRepository;

  PostStoryUseCase({
    required this.storyRepository,
  });

  @override
  Future<Either<FailureResponse, CreateStoryResponseEntity>> call(
      CreateStoryBodyEntity parameter) async {
    if (parameter.file.isNull() && parameter.description.isEmpty) {
      return Left(
        FailureResponse(errorMessage: "Isi dulu semuanya ya"),
      );
    } else if (parameter.file.isNull()) {
      return Left(
        FailureResponse(errorMessage: "Isi dulu gambarnya ya"),
      );
    } else if (parameter.description.isEmpty) {
      return Left(
        FailureResponse(errorMessage: "Isi dulu deskripsinya ya"),
      );
    } else {
      return await storyRepository.createStory(
        data: parameter,
      );
    }
  }
}

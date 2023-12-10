import 'package:shared_libraries/get_it/get_it.dart';
import 'package:story_core/data/datasources/remote/stories_remote_datasource.dart';
import 'package:story_core/data/mapper/story_mapper.dart';
import 'package:story_core/data/repository/story_repository_impl.dart';
import 'package:story_core/domains/repository/story_repository.dart';
import 'package:story_core/domains/usecases/get_stories_usecase.dart';
import 'package:story_core/domains/usecases/get_story_usecase.dart';
import 'package:story_core/domains/usecases/post_story_usecase.dart';

class StoryInjection {
  StoryInjection() {
    _datasources();
    _mappers();
    _repositories();
    _usecases();
  }

  _datasources() {
    sl.registerLazySingleton<StoriesRemoteDatasource>(
      () => StoriesRemoteDatasourceImpl(
        dio: sl(),
      ),
    );
  }

  _mappers() {
    sl.registerLazySingleton<StoryMapper>(
      () => const StoryMapper(),
    );
  }

  _repositories() {
    sl.registerLazySingleton<StoryRepository>(
      () => StoryRepositoryImpl(
        storiesRemoteDatasource: sl(),
        storyMapper: sl(),
      ),
    );
  }

  _usecases() {
    sl.registerLazySingleton<PostStoryUseCase>(
      () => PostStoryUseCase(
        storyRepository: sl(),
      ),
    );
    sl.registerLazySingleton<GetStoriesUseCase>(
      () => GetStoriesUseCase(
        storyRepository: sl(),
      ),
    );
    sl.registerLazySingleton<GetStoryUseCase>(
      () => GetStoryUseCase(
        storyRepository: sl(),
      ),
    );
  }
}

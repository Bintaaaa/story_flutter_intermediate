import 'package:shared_common/states/view_data_state.dart';
import 'package:shared_common/usecase/usecase.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:story_core/domains/entities/create_story_body_entity.dart';
import 'package:story_core/domains/usecases/get_stories_usecase.dart';
import 'package:story_core/domains/usecases/get_story_usecase.dart';
import 'package:story_core/domains/usecases/post_story_usecase.dart';
import 'package:story_features/bloc/story_state.dart';

class StoryCubit extends Cubit<StoryState> {
  final GetStoriesUseCase getStoriesUseCase;
  final GetStoryUseCase getStoryUseCase;
  final PostStoryUseCase postStoryUseCase;

  StoryCubit({
    required this.getStoriesUseCase,
    required this.getStoryUseCase,
    required this.postStoryUseCase,
  }) : super(
          StoryState(
            stateStories: ViewData.initial(),
            stateStory: ViewData.initial(),
            stateCreateStory: ViewData.initial(),
          ),
        );

  void getStories() async {
    emit(
      state.copyWith(
        stateStories: ViewData.loading(),
      ),
    );
    final result = await getStoriesUseCase.call(
      const NoParams(),
    );
    result.fold(
        (failure) => emit(
              state.copyWith(
                stateStories: ViewData.error(
                  message: failure.errorMessage!,
                ),
              ),
            ), (data) {
      if (data.listStory.isEmpty) {
        emit(
          state.copyWith(
            stateStories: ViewData.noData(
              message: "No Data",
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(
              stateStories: ViewData.loaded(
            data: data,
          )),
        );
      }
    });
  }

  void getStory(String id) async {
    emit(
      state.copyWith(
        stateStory: ViewData.loading(),
      ),
    );
    final result = await getStoryUseCase.call(id);
    result.fold(
        (failure) => emit(
              state.copyWith(
                stateStory: ViewData.error(
                  message: failure.errorMessage!,
                ),
              ),
            ), (data) {
      emit(
        state.copyWith(
          stateStory: ViewData.loaded(
            data: data,
          ),
        ),
      );
    });
  }

  void postStory(
    String description,
    List<int> photoBytes,
  ) async {
    emit(
      state.copyWith(
        stateCreateStory: ViewData.loading(),
      ),
    );
    final result = await postStoryUseCase.call(
      CreateStoryBodyEntity(
        description: description,
        photoBytes: photoBytes,
      ),
    );
    result.fold(
        (failure) => emit(
              state.copyWith(
                stateCreateStory: ViewData.error(
                  message: failure.errorMessage!,
                ),
              ),
            ), (data) {
      emit(
        state.copyWith(
          stateCreateStory: ViewData.loaded(
            data: data,
          ),
        ),
      );
    });
  }
}

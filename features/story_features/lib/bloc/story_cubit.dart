import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:shared_common/states/view_data_state.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/image_picker/image_picker.dart';
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
            stateImage: ViewData.initial(),
          ),
        );

  Future<void> getStories() async {
    emit(
      state.copyWith(
        stateStories: ViewData.loading(),
      ),
    );
    getLazyStories(page: 1);
  }

  Future<void> getLazyStories({int? page = 0}) async {
    final result = await getStoriesUseCase.call(page!);
    result.fold(
        (failure) => emit(
              state.copyWith(
                stateStories: ViewData.error(
                  message: failure.errorMessage!,
                ),
              ),
            ), (data) {
      if (data.listStories.isEmpty) {
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
            ),
          ),
        );
      }
    });
  }

  Future<void> getStory(String id) async {
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

  Future<void> postStory(
    String description,
  ) async {
    emit(
      state.copyWith(
        stateCreateStory: ViewData.loading(),
      ),
    );
    final result = await postStoryUseCase.call(
      CreateStoryBodyEntity(
        description: description,
        file: state.stateImage.data,
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

  void getImage() async {
    final isMacOS = defaultTargetPlatform == TargetPlatform.macOS;
    final isLinux = defaultTargetPlatform == TargetPlatform.linux;
    if (isMacOS || isLinux || kIsWeb) return;

    try {
      final ImagePicker imagePicker = ImagePicker();

      final result = await imagePicker.pickImage(
        source: ImageSource.camera,
      );

      emit(
        state.copyWith(
          stateImage: ViewData.loaded(
            data: File(
              result!.path,
            ),
          ),
        ),
      );
    } catch (e) {
      ViewData.error(
        message: "Gagal mengambil gamber",
      );
    }
  }
}

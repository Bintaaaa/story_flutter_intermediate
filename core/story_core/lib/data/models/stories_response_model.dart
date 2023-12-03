import 'package:story_core/data/models/story_response_model.dart';

class StoriesResponseModel {
  final bool? error;
  final String? message;
  final List<StoryResponseModel>? listStory;

  const StoriesResponseModel({
    this.error,
    this.message,
    this.listStory,
  });

  factory StoriesResponseModel.fromJson(Map<String, dynamic> json) => StoriesResponseModel(
        error: json["error"],
        message: json["message"],
        listStory: List<StoryResponseModel>.from(
          json["listStory"]!.map(
            (x) => StoryResponseModel.fromJson(x),
          ),
        ),
      );
}

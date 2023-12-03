import 'package:story_core/data/models/story_item_response_model.dart';

class StoriesResponseModel {
  final bool? error;
  final String? message;
  final List<StoryItemResponseModel>? listStory;

  const StoriesResponseModel({
    this.error,
    this.message,
    this.listStory,
  });

  factory StoriesResponseModel.fromJson(Map<String, dynamic> json) => StoriesResponseModel(
        error: json["error"],
        message: json["message"],
        listStory: List<StoryItemResponseModel>.from(
          json["listStory"]!.map(
            (x) => StoryItemResponseModel.fromJson(x),
          ),
        ),
      );
}

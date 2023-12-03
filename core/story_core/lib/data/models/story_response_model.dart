import 'package:story_core/data/models/story_item_response_model.dart';

class StoryResponseModel {
  final bool? error;
  final String? message;
  final StoryItemResponseModel? story;

  const StoryResponseModel({
    this.error,
    this.message,
    this.story,
  });

  factory StoryResponseModel.fromJson(Map<String, dynamic> json) => StoryResponseModel(
        error: json["error"],
        message: json["message"],
        story: StoryItemResponseModel.fromJson(
          json["story"],
        ),
      );
}

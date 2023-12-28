import 'package:json_annotation/json_annotation.dart';
import 'package:story_core/data/models/story_item_response_model.dart';

part 'story_response_model.g.dart';

@JsonSerializable()
class StoryResponseModel {
  final bool? error;
  final String? message;
  final StoryItemResponseModel? story;

  const StoryResponseModel({
    this.error,
    this.message,
    this.story,
  });

  factory StoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StoryResponseModelFromJson(json);
}

import 'package:json_annotation/json_annotation.dart';
import 'package:story_core/data/models/story_item_response_model.dart';

part 'stories_response_model.g.dart';

@JsonSerializable()
class StoriesResponseModel {
  final bool? error;
  final String? message;
  final List<StoryItemResponseModel>? listStory;

  const StoriesResponseModel({
    this.error,
    this.message,
    this.listStory,
  });

  factory StoriesResponseModel.fromJson(Map<String, dynamic> json) => _$StoriesResponseModelFromJson(json);
}

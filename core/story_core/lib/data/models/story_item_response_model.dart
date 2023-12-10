import 'package:json_annotation/json_annotation.dart';

part 'story_item_response_model.g.dart';

@JsonSerializable()
class StoryItemResponseModel {
  final String? id;
  final String? name;
  final String? description;
  final String? photoUrl;
  final String? createdAt;
  final double? lat;
  final double? lon;

  StoryItemResponseModel({
    this.id,
    this.name,
    this.description,
    this.photoUrl,
    this.createdAt,
    this.lat,
    this.lon,
  });

  factory StoryItemResponseModel.fromJson(Map<String, dynamic> json) => _$StoryItemResponseModelFromJson(json);
}

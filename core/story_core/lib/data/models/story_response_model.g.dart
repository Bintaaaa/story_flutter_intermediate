// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryResponseModel _$StoryResponseModelFromJson(Map<String, dynamic> json) =>
    StoryResponseModel(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      story: json['story'] == null
          ? null
          : StoryItemResponseModel.fromJson(
              json['story'] as Map<String, dynamic>),
    );

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoriesResponseModel _$StoriesResponseModelFromJson(
        Map<String, dynamic> json) =>
    StoriesResponseModel(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      listStory: (json['listStory'] as List<dynamic>?)
          ?.map(
              (e) => StoryItemResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

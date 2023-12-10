// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_item_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryItemResponseModel _$StoryItemResponseModelFromJson(
        Map<String, dynamic> json) =>
    StoryItemResponseModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      photoUrl: json['photoUrl'] as String?,
      createdAt: json['createdAt'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$StoryItemResponseModelToJson(
        StoryItemResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'photoUrl': instance.photoUrl,
      'createdAt': instance.createdAt,
      'lat': instance.lat,
      'lon': instance.lon,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tier_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TierItem _$TierItemFromJson(Map<String, dynamic> json) => TierItem(
  name: json['name'] as String,
  description: json['description'] as String? ?? '',
  thumbnailUrl: json['thumbnailUrl'] as String?,
  imageUrl: json['imageUrl'] as String?,
  tags: (json['tags'] as List<dynamic>)
      .map((e) => Tag.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TierItemToJson(TierItem instance) => <String, dynamic>{
  'thumbnailUrl': instance.thumbnailUrl,
  'imageUrl': instance.imageUrl,
  'name': instance.name,
  'description': instance.description,
  'tags': instance.tags,
};

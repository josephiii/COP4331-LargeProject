import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
import 'tier.dart';
import 'tag.dart';
import 'tier_item.dart';
import 'staging_area.dart';
import 'json_map.dart';
import 'package:flutter/material.dart';

part 'tier_list.g.dart';

List<Tier> defaultTiers = [
  Tier(name: 'S', color: const Color(0xFFEF4444), items: []),
  Tier(name: 'A', color: const Color(0xFFF97316), items: []),
  Tier(name: 'B', color: const Color(0xFFEAB308), items: []),
  Tier(name: 'C', color: const Color(0xFF22C55E), items: []),
  Tier(name: 'D', color: const Color(0xFF3B82F6), items: []),
];

@immutable
@JsonSerializable()
class TierList extends Equatable {
  @JsonKey(name: '_id')
  final String id;

  final String title;
  final String description;

  @JsonKey(name: 'categories')
  final List<Tier> tiers;

  @JsonKey(
    name: 'unassignedItems',
    fromJson: _stagingAreaFromUnassignedItems,
    toJson: _unassignedItemsFromStagingArea,
  )
  final StagingArea stagingArea;

  final bool pinned;

  TierList({
    String? id,
    required this.title,
    this.description = '',
    required this.tiers,
    required this.stagingArea,
    this.pinned = false,
  }) : id = id ?? const Uuid().v4();

  TierList copyWith({
    String? id,
    String? title,
    String? description,
    List<Tier>? tiers,
    StagingArea? stagingArea,
    bool? pinned,
  }) {
    return TierList(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      tiers: tiers ?? List.from(this.tiers),
      stagingArea: stagingArea ?? this.stagingArea,
      pinned: pinned ?? this.pinned,
    );
  }

  static TierList fromJson(JsonMap json) => _$TierListFromJson(json);

  JsonMap toJson() => _$TierListToJson(this);

  @override
  List<Object> get props => [id, title, description, tiers, stagingArea, pinned];
}

StagingArea _stagingAreaFromUnassignedItems(List<dynamic> itemsJson) {
  final items = itemsJson
      .map((itemJson) => TierItem.fromJson(itemJson as Map<String, dynamic>))
      .toList();
  return StagingArea(items: items);
}

List<Map<String, dynamic>> _unassignedItemsFromStagingArea(
  StagingArea stagingArea,
) {
  return stagingArea.items.map((item) => item.toJson()).toList();
}
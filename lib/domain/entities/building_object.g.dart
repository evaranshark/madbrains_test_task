// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'building_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BuildingObjectImpl _$$BuildingObjectImplFromJson(Map<String, dynamic> json) =>
    _$BuildingObjectImpl(
      title: json['title'] as String,
      remainingPoints: json['remaining_points'] as int,
      totalPointsCount: json['total_points_count'] as int,
      points: (json['points'] as List<dynamic>)
          .map((e) => BuildingPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BuildingObjectImplToJson(
        _$BuildingObjectImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'remaining_points': instance.remainingPoints,
      'total_points_count': instance.totalPointsCount,
      'points': instance.points,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buildingpoint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BuildingPointImpl _$$BuildingPointImplFromJson(Map<String, dynamic> json) =>
    _$BuildingPointImpl(
      x: json['x'] as int,
      y: json['y'] as int,
      status: $enumDecode(_$BuildingPointStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$BuildingPointImplToJson(_$BuildingPointImpl instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'status': _$BuildingPointStatusEnumMap[instance.status]!,
    };

const _$BuildingPointStatusEnumMap = {
  BuildingPointStatus.completed: 'completed',
  BuildingPointStatus.incompleted: 'incompleted',
};

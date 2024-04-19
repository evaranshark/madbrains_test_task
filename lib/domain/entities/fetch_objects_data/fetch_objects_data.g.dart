// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_objects_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchObjectsData _$FetchObjectsDataFromJson(Map<String, dynamic> json) =>
    FetchObjectsData(
      payload: (json['payload'] as List<dynamic>)
          .map((e) => BuildingObject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FetchObjectsDataToJson(FetchObjectsData instance) =>
    <String, dynamic>{
      'payload': instance.payload,
    };

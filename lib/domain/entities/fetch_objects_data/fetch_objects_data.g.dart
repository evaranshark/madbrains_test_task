// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_objects_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchRObjectsData _$FetchRObjectsDataFromJson(Map<String, dynamic> json) =>
    FetchRObjectsData(
      payload: (json['payload'] as List<dynamic>)
          .map((e) => BuildingObject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FetchRObjectsDataToJson(FetchRObjectsData instance) =>
    <String, dynamic>{
      'payload': instance.payload,
    };

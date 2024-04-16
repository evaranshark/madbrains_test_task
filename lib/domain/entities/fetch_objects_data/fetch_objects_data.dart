import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../building_object.dart';

part 'fetch_objects_data.g.dart';

@JsonSerializable()
class FetchRObjectsData with EquatableMixin {
  FetchRObjectsData({required this.payload});

  factory FetchRObjectsData.fromJson(Map<String, dynamic> json) =>
      _$FetchRObjectsDataFromJson(json);

  final List<BuildingObject> payload;

  @override
  List<Object?> get props => [payload];
}

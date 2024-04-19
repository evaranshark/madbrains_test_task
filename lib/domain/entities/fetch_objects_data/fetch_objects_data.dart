import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../building_object.dart';

part 'fetch_objects_data.g.dart';

@JsonSerializable()
class FetchObjectsData with EquatableMixin {
  FetchObjectsData({required this.payload});

  factory FetchObjectsData.fromJson(Map<String, dynamic> json) =>
      _$FetchObjectsDataFromJson(json);

  final List<BuildingObject> payload;

  @override
  List<Object?> get props => [payload];
}

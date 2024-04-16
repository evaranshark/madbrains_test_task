// ignore_for_file: invalid_annotation_target

import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'buildingpoint.dart';

part 'building_object.freezed.dart';
part 'building_object.g.dart';

@freezed
class BuildingObject with _$BuildingObject, EquatableMixin {
  const BuildingObject._();
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BuildingObject({
    required String title,
    required int remainingPoints,
    required int totalPointsCount,
    required List<BuildingPoint> points,
  }) = _BuildingObject;

  factory BuildingObject.fromJson(Map<String, Object?> json) =>
      _$BuildingObjectFromJson(json);

  @override
  List<Object?> get props => [
        title,
        remainingPoints,
        totalPointsCount,
        points,
      ];
}

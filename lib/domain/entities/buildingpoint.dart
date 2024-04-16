import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'buildingpoint.freezed.dart';
part 'buildingpoint.g.dart';

@freezed
class BuildingPoint with _$BuildingPoint, EquatableMixin {
  const BuildingPoint._();
  factory BuildingPoint({
    required int x,
    required int y,
    required BuildingPointStatus status,
  }) = _BuildingPoint;

  factory BuildingPoint.fromJson(Map<String, dynamic> json) =>
      _$BuildingPointFromJson(json);

  @override
  List<Object?> get props => [x, y];
}

enum BuildingPointStatus {
  @JsonValue('completed')
  completed,
  @JsonValue('incompleted')
  incompleted,
}

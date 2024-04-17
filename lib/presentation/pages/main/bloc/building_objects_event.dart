part of 'building_objects_bloc.dart';

abstract class BuildingObjectsEvent {}

class BuildingObjectsLoad extends BuildingObjectsEvent {}

class BuildingObjectsFilter extends BuildingObjectsEvent {
  BuildingObjectsFilter({required this.pattern});

  final String pattern;
}

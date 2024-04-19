part of 'building_objects_bloc.dart';

abstract class BuildingObjectsEvent {}

class BuildingObjectsLoad extends BuildingObjectsEvent {}

class BuildingObjectsFilter extends BuildingObjectsEvent {
  BuildingObjectsFilter({required this.pattern});

  final String pattern;
}

class BuildingObjectsSelectObject extends BuildingObjectsEvent {
  BuildingObjectsSelectObject({required this.object});

  final BuildingObject object;
}

class BuildingObjectsLoadMemoryInfo extends BuildingObjectsEvent {}

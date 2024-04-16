part of 'building_objects_bloc.dart';

abstract class BuildingObjectsState {}

class BuildingObjectsInitial extends BuildingObjectsState {}

class BuildingObjectsLoading extends BuildingObjectsState {}

class BuildingObjectsDataRetrieved extends BuildingObjectsState {
  BuildingObjectsDataRetrieved({
    required this.objects,
  });

  final List<BuildingObject> objects;
}

class BuildingObjectsError extends BuildingObjectsState {
  BuildingObjectsError({
    this.error,
  });

  final Exception? error;
}

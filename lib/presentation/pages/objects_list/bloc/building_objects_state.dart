part of 'building_objects_bloc.dart';

abstract class BuildingObjectsState {}

class BuildingObjectsInitial extends BuildingObjectsState {}

class BuildingObjectsLoading extends BuildingObjectsState {}

class BuildingObjectsDataRetrieved extends BuildingObjectsState {
  BuildingObjectsDataRetrieved({
    required this.objects,
    this.freeMemory,
  });

  final List<BuildingObject> objects;
  final double? freeMemory;

  BuildingObjectsDataRetrieved copyWith({
    List<BuildingObject>? objects,
    double? freeMemory,
  }) {
    return BuildingObjectsDataRetrieved(
      objects: objects ?? this.objects,
      freeMemory: freeMemory ?? this.freeMemory,
    );
  }
}

class BuildingObjectsError extends BuildingObjectsState {
  BuildingObjectsError({
    this.error,
  });

  final Exception? error;
}

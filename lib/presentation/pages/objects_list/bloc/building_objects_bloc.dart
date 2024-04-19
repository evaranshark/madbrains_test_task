import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storage_space/storage_space.dart';

import '../../../../domain/entities/building_object.dart';
import '../../../../domain/repository/buildings_repository.dart';

part 'building_objects_event.dart';
part 'building_objects_state.dart';

class BuildingObjectsBloc
    extends Bloc<BuildingObjectsEvent, BuildingObjectsState> {
  BuildingObjectsBloc({required BuildingsRepository repository})
      : _repo = repository,
        super(BuildingObjectsInitial()) {
    on<BuildingObjectsLoad>((event, emit) async {
      emit(BuildingObjectsLoading());
      try {
        _objects = await _repo.fetchObjects();
        emit(
          BuildingObjectsDataRetrieved(
            objects: _objects!.where(_matchesName).toList(),
            freeMemory: _memoryInfo,
          ),
        );
      } on Exception catch (e) {
        emit(
          BuildingObjectsError(
            error: e,
          ),
        );
      }
    });
    on<BuildingObjectsFilter>(
      (event, emit) {
        _nameFilter = event.pattern.toLowerCase();
        emit(
          BuildingObjectsDataRetrieved(
            objects: _objectsFiltered ?? [],
            freeMemory: _memoryInfo,
          ),
        );
      },
    );
    on<BuildingObjectsSelectObject>(
      (event, emit) {
        _repo.selectObject(event.object);
      },
    );
    on<BuildingObjectsLoadMemoryInfo>(
      (event, emit) async {
        final freeSpace = await getStorageSpace(
          lowOnSpaceThreshold: 2 * 1024 * 1024 * 1024,
          fractionDigits: 1,
        );
        // Free space in GB
        _memoryInfo = freeSpace.free / 1024 / 1024 / 1024;
        if (state is BuildingObjectsDataRetrieved) {
          emit(
            BuildingObjectsDataRetrieved(
              objects: _objectsFiltered!,
              freeMemory: _memoryInfo,
            ),
          );
        }
      },
    );
  }

  final BuildingsRepository _repo;
  List<BuildingObject>? _objects;
  double? _memoryInfo;
  String _nameFilter = '';
  List<BuildingObject>? get _objectsFiltered =>
      _objects?.where(_matchesName).toList();

  bool _matchesName(BuildingObject element) =>
      element.title.toLowerCase().contains(_nameFilter);
}

import 'package:flutter_bloc/flutter_bloc.dart';

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
          ),
        );
      },
    );
    on<BuildingObjectsSelectObject>(
      (event, emit) {
        _repo.selectObject(event.object);
      },
    );
  }

  final BuildingsRepository _repo;
  List<BuildingObject>? _objects;
  String _nameFilter = '';
  List<BuildingObject>? get _objectsFiltered =>
      _objects?.where(_matchesName).toList();

  bool _matchesName(BuildingObject element) =>
      element.title.toLowerCase().contains(_nameFilter);
}

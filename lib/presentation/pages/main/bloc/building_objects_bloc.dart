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
        final data = await _repo.fetchObjects();
        emit(
          BuildingObjectsDataRetrieved(
            objects: data,
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
  }

  final BuildingsRepository _repo;
}

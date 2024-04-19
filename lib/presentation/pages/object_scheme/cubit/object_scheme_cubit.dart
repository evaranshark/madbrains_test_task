import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/building_object.dart';
import '../../../../domain/repository/buildings_repository.dart';

part 'object_scheme_state.dart';

class ObjectSchemeCubit extends Cubit<ObjectSchemeState> {
  ObjectSchemeCubit({required BuildingsRepository repository})
      : _repo = repository,
        super(ObjectSchemeState());
  final BuildingsRepository _repo;

  void getObjectData() {
    emit(
      ObjectSchemeState(object: _repo.getSelectedObject()),
    );
  }
}

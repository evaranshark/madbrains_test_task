import '../entities/building_object.dart';

abstract interface class BuildingsRepository {
  Future<List<BuildingObject>> fetchObjects();

  void selectObject(BuildingObject object);
  BuildingObject getSelectedObject();
}

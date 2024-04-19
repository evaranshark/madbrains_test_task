import '../domain/entities/building_object.dart';
import '../domain/entities/fetch_objects_data/fetch_objects_data.dart';
import '../domain/repository/buildings_repository.dart';
import 'mock_datasource.dart';

class BuildingsRepositoryImpl implements BuildingsRepository {
  BuildingsRepositoryImpl({
    required this.dataSource,
  });

  final MockDataSource dataSource;
  BuildingObject? _selectedObject;

  @override
  Future<List<BuildingObject>> fetchObjects() async {
    final response = await dataSource.fetchObjects();
    if (response.statusCode != 200) {
      throw ApiError(
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    }
    return FetchObjectsData.fromJson(response.data!).payload;
  }

  ///Will throw if no object been selected before
  @override
  BuildingObject getSelectedObject() {
    return _selectedObject!;
  }

  @override
  void selectObject(BuildingObject object) {
    _selectedObject = object;
  }
}

class ApiError implements Exception {
  ApiError({
    this.statusCode,
    this.statusMessage,
  });

  final int? statusCode;
  final String? statusMessage;
}

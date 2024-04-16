import '../domain/entities/building_object.dart';
import '../domain/entities/fetch_objects_data/fetch_objects_data.dart';
import '../domain/repository/buildings_repository.dart';
import 'mock_datasource.dart';

class BuildingsRepositoryImpl implements BuildingsRepository {
  BuildingsRepositoryImpl({
    required this.dataSource,
  });

  final MockDataSource dataSource;

  @override
  Future<List<BuildingObject>> fetchObjects() async {
    final response = await dataSource.fetchObjects();
    if (response.statusCode != 200) {
      throw ApiError(
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    }
    return FetchRObjectsData.fromJson(response.data!).payload;
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

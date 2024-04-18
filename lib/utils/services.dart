import 'package:get_it/get_it.dart';

import '../data/buildings_repository_impl.dart';
import '../data/mock_datasource.dart';
import '../domain/repository/buildings_repository.dart';
import 'router.dart';
import 'theme_values.dart';

final services = GetIt.instance;

void initServices() {
  services.registerSingleton<ThemeValues>(ThemeValues());
  services.registerSingleton<AppRouter>(AppRouter());
  services.registerSingleton<MockDataSource>(MockDataSource());
  services.registerSingleton<BuildingsRepository>(
    BuildingsRepositoryImpl(
      dataSource: services.get<MockDataSource>(),
    ),
  );
}

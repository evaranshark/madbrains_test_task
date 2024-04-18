import 'package:flutter/material.dart';

import 'utils/router.dart';
import 'utils/services.dart';
import 'utils/theme_values.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initServices();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    final themeValues = services.get<ThemeValues>();
    return MaterialApp.router(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 238, 242, 255),
        colorScheme: const ColorScheme.light(
          background: Color.fromARGB(255, 238, 242, 255),
          surface: Colors.white,
          surfaceTint: Colors.transparent,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 238, 242, 255),
        ),
        snackBarTheme: ThemeData.light().snackBarTheme.copyWith(
              behavior: SnackBarBehavior.floating,
            ),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: themeValues.titleMedium,
              bodyMedium: themeValues.bodyMedium,
              bodyLarge: themeValues.bodyLarge,
              labelSmall: themeValues.labelSmall,
              labelMedium: themeValues.labelMedium,
            ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          contentPadding: const EdgeInsets.all(8.0),
        ),
        navigationBarTheme: NavigationBarThemeData(
          indicatorColor: Colors.transparent,
          iconTheme: MaterialStateProperty.resolveWith<IconThemeData>(
            (states) => const IconThemeData.fallback().copyWith(
              color: (states.contains(MaterialState.selected)
                  ? themeValues.selectedColor
                  : themeValues.unselectedColor),
            ),
          ),
          labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (states) => themeValues.labelMedium.copyWith(
              color: (states.contains(MaterialState.selected)
                  ? themeValues.selectedColor
                  : themeValues.unselectedColor),
            ),
          ),
        ),
      ),
      routerConfig: services.get<AppRouter>().router,
    );
  }
}

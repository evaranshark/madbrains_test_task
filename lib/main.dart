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
        scaffoldBackgroundColor: themeValues.colors.background,
        colorScheme: ColorScheme.light(
          background: themeValues.colors.background,
          surface: themeValues.colors.surfaceMain,
          surfaceTint: Colors.transparent,
          primary: themeValues.colors.primary,
          shadow: themeValues.colors.surfaceShadow,
        ),
        shadowColor: themeValues.colors.surfaceShadow,
        appBarTheme: AppBarTheme(
          elevation: 10.0,
          backgroundColor: themeValues.colors.surfaceMain,
          shadowColor: themeValues.colors.surfaceShadow,
          surfaceTintColor: themeValues.colors.surfaceShadow,
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
          elevation: 10.0,
          shadowColor: themeValues.colors.surfaceShadow,
          indicatorColor: Colors.transparent,
          iconTheme: MaterialStateProperty.resolveWith<IconThemeData>(
            (states) => const IconThemeData.fallback().copyWith(
              color: (states.contains(MaterialState.selected)
                  ? themeValues.colors.primary
                  : themeValues.colors.unselected),
            ),
          ),
          labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (states) => themeValues.labelMedium.copyWith(
              color: (states.contains(MaterialState.selected)
                  ? themeValues.colors.primary
                  : themeValues.colors.unselected),
            ),
          ),
        ),
      ),
      routerConfig: services.get<AppRouter>().router,
    );
  }
}

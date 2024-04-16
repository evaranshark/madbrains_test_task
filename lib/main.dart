import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'presentation/pages/main/main_page.dart';
import 'utils/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initServices();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 238, 242, 255),
        colorScheme: const ColorScheme.light(
          background: Color.fromARGB(255, 238, 242, 255),
          surface: Colors.white,
          surfaceTint: Colors.transparent,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 238, 242, 255),
        ),
        snackBarTheme: ThemeData.light().snackBarTheme.copyWith(
              behavior: SnackBarBehavior.floating,
            ),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                height: 24 / 16,
                color: Colors.black,
              ),
              bodyMedium: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 20 / 14,
                color: Colors.black,
              ),
              labelSmall: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                fontSize: 11,
                height: 16 / 11,
                color: const Color.fromARGB(
                  255,
                  107,
                  108,
                  108,
                ),
              ),
            ),
      ),
      home: MainPage(),
    );
  }
}

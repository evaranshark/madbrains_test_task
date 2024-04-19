import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeValues {
  final titleMedium = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 24 / 16,
    color: Colors.black,
  );
  final bodyMedium = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 20 / 14,
    color: Colors.black,
  );
  final bodyLarge = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 24 / 16,
    color: Colors.black,
  );
  final labelSmall = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 11,
    height: 16 / 11,
    color: const Color.fromARGB(
      255,
      107,
      108,
      108,
    ),
  );
  final labelMedium = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height: 16 / 12,
    color: const Color.fromARGB(
      255,
      107,
      108,
      108,
    ),
  );

  final colors = ColorValues();
}

class ColorValues {
  final primary = const Color.fromARGB(
    255,
    74,
    111,
    244,
  );
  final primary50 = Color.fromARGB(255, 235, 239, 254);
  final unselected = const Color.fromARGB(
    255,
    68,
    70,
    79,
  );
  final background = const Color.fromARGB(255, 238, 242, 255);
  final success = const Color.fromARGB(255, 76, 216, 116);
  final successLight = const Color.fromARGB(255, 227, 249, 235);
  final surfaceMain = Colors.white;
}

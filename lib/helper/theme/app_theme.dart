import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adv_test/helper/theme/text_styles.dart';

import '../resources/dimension_resources.dart';
import 'app_colors.dart';


class AppTheme {
  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.poppins().fontFamily,
    brightness: Brightness.light,
    textTheme: textThemes,
  );
}




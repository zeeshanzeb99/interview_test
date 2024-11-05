import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../resources/dimension_resources.dart';
import 'app_colors.dart';

TextTheme textThemes = TextTheme(
  displayLarge: GoogleFonts.poppins(
    fontSize: Dim.FONT_SIZE_4X_EXTRA_LARGE,
    fontWeight: FontWeight.w700,
    color: AppColors.PRIMARY_DARK
  ),
  displayMedium: GoogleFonts.poppins(
    fontSize: Dim.FONT_SIZE_3X_EXTRA_LARGE,
    fontWeight: FontWeight.w500,
  ),
  displaySmall: GoogleFonts.poppins(
    fontSize: Dim.FONT_SIZE_2X_EXTRA_LARGE,
    fontWeight: FontWeight.w300,
  ),
  headlineLarge: GoogleFonts.poppins(
    fontSize: Dim.FONT_SIZE_1X_EXTRA_LARGE,
    fontWeight: FontWeight.w700,
      color: AppColors.PRIMARY_DARK
  ),
  headlineMedium: GoogleFonts.poppins(
    fontSize: Dim.FONT_SIZE_LARGE,
    fontWeight: FontWeight.w500,
  ),
  headlineSmall: GoogleFonts.poppins(
    fontSize: Dim.FONT_SIZE_4X_EXTRA_MEDIUM,
    fontWeight: FontWeight.w300,
  ),
  titleLarge: GoogleFonts.poppins(
    fontSize: Dim.FONT_SIZE_3X_EXTRA_MEDIUM,
    fontWeight: FontWeight.w700,
      color: AppColors.PRIMARY_DARK
  ),
  titleMedium: GoogleFonts.poppins(
    fontSize: Dim.FONT_SIZE_2X_EXTRA_MEDIUM,
    fontWeight: FontWeight.w500,

  ),
  titleSmall: GoogleFonts.poppins(
    fontSize: Dim.FONT_SIZE_1X_EXTRA_MEDIUM,
    fontWeight: FontWeight.w300,
  ),
  labelLarge: GoogleFonts.poppins(
    fontSize: Dim.FONT_SIZE_MEDIUM,
    fontWeight: FontWeight.w700,
      color: AppColors.PRIMARY_DARK
  ),
  labelMedium: GoogleFonts.poppins(
    fontSize: Dim.FONT_SIZE_SMALL,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    color: AppColors.PRIMARY_DARK,
  ),
  labelSmall: GoogleFonts.poppins(
    fontSize: Dim.FONT_SIZE_1X_EXTRA_SMALL,
    fontWeight: FontWeight.w300,
  ),
  bodyLarge: GoogleFonts.poppins(
    fontSize: Dim.FONT_SIZE_2X_EXTRA_SMALL,
    fontWeight: FontWeight.w700,
      color: AppColors.PRIMARY_DARK
  ),
  bodyMedium: GoogleFonts.poppins(
    fontSize: Dim.FONT_SIZE_3X_EXTRA_SMALL,
    fontWeight: FontWeight.w500,
  ),
  bodySmall: GoogleFonts.poppins(
    fontSize: Dim.D_12,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: AppColors.PRIMARY_DARK,
  ),
);

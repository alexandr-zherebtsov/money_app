import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_app/shared/styles/colors.dart';

class AppThemes {
  static ThemeData getTheme() => light;

  static final ThemeData light = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightGray,
    cardColor: AppColors.white,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.primary,
      shadowColor: AppColors.transparent,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      titleTextStyle: GoogleFonts.montserrat(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.montserrat(
        color: AppColors.white,
        fontSize: 70,
        fontWeight: FontWeight.w600,
      ),
      displayMedium: GoogleFonts.montserrat(
        color: AppColors.white,
        fontSize: 50,
        fontWeight: FontWeight.w600,
      ),
      displaySmall: GoogleFonts.montserrat(
        color: AppColors.white,
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: GoogleFonts.montserrat(
        color: AppColors.black,
        fontSize: 22,
        fontWeight: FontWeight.w200,
      ),
      labelLarge: GoogleFonts.montserrat(
        color: AppColors.grayHover,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      labelSmall: GoogleFonts.montserrat(
        color: AppColors.darkSecondary,
        fontSize: 10,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: GoogleFonts.montserrat(
        color: AppColors.black,
        fontSize: 50,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: GoogleFonts.montserrat(
        color: AppColors.black,
        fontSize: 23,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: GoogleFonts.montserrat(
        color: AppColors.black,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: GoogleFonts.montserrat(
        color: AppColors.black,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zbooma_to_do_app/core/theme/colors.dart';
import 'package:zbooma_to_do_app/core/theme/styles.dart';

/// Light Theme Configuration
ThemeData appThemeLight() {
  return ThemeData(
    textTheme: GoogleFonts.almaraiTextTheme(),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 1.1,
      backgroundColor: ColorsManager.dangerRed300,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: Styles.textLMedium.copyWith(
          color: ColorsManager.BLACK_COLOR,
        ),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      clipBehavior: Clip.antiAlias,
      constraints: BoxConstraints(maxWidth: double.infinity),
      showDragHandle: true,
      modalBarrierColor: Colors.transparent,
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    scaffoldBackgroundColor: ColorsManager.BACKGROUND_LIGHT,
    colorScheme: ColorScheme.fromSeed(seedColor: ColorsManager.PRIMARY_COLOR),
  );
}

/// Dark Theme Configuration
ThemeData appThemeDark() {
  return ThemeData.dark().copyWith(
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: Styles.textLMedium.copyWith(
          color: ColorsManager.TEXT_GREY_COLOR,
        ),
      ),
    ),

    bottomSheetTheme: const BottomSheetThemeData(
      clipBehavior: Clip.antiAlias,
      constraints: BoxConstraints(maxWidth: double.infinity),
      showDragHandle: true,
      modalBarrierColor: Colors.transparent,
    ),

    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.BLACK_COLOR,
    ),

    listTileTheme: const ListTileThemeData(),

    // Use Google Fonts for specific text styles in Dark mode
    textTheme: GoogleFonts.interTextTheme(),

    scaffoldBackgroundColor: ColorsManager.BLACK_COLOR,

    colorScheme: ColorScheme.fromSeed(seedColor: ColorsManager.PRIMARY_COLOR),
  );
}

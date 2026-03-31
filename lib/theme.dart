import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppTheme {
  static ThemeData light =
      FlexThemeData.light(
        colors: const FlexSchemeColor(
          primary: Color(0xFFA4E627),
          primaryContainer: Color(0xFFED0808),
          primaryLightRef: Color(0xFF231932),
          secondary: Color(0xFFFF1A00),
          secondaryContainer: Color(0xFFFFDBCF),
          secondaryLightRef: Color(0xFFAC3306),
          tertiary: Color(0xFF988F8F),
          tertiaryContainer: Color(0xFF95F0FF),
          tertiaryLightRef: Color(0xFF2F0166),
          appBarColor: Color(0xFFFFDBCF),
          error: Color(0xFFFF383C),
          errorContainer: Color(0xFFF81F07),

        ),
        scaffoldBackground: Colors.white,
        appBarStyle: FlexAppBarStyle.scaffoldBackground,
        lightIsWhite: true,
        subThemesData: const FlexSubThemesData(
          inputDecoratorBorderType: FlexInputBorderType.outline,
          inputDecoratorRadius: 10.0,
          inputDecoratorIsFilled: true,
          alignedDropdown: true,
          tooltipRadius: 4,
          snackBarElevation: 6,
          navigationRailUseIndicator: true,
          navigationRailLabelType: NavigationRailLabelType.all,
        ),
        keyColors: const FlexKeyColors(keepPrimary: true),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
      ).copyWith(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          hintStyle: const TextStyle(color: Color(0xFF9E9E9E)),
          prefixIconColor: const Color(0xFF9E9E9E),
          suffixIconColor: const Color(0xFF9E9E9E),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFA4E627), width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFBA1A1A)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFBA1A1A), width: 1.5),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
        ),

        /*// GLOBAL TEXT THEME
        textTheme: GoogleFonts.interTextTheme().copyWith(
          displayLarge: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: Color(0xFF0A0D14),
          ),
          titleLarge: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xFF0A0D14),
          ),
          titleMedium: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF0A0D14),
          ),
          bodyLarge: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF0A0D14),
          ),
          bodyMedium: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF0A0D14),
          ),
          bodySmall: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFF6B7280),
          ),
          labelLarge: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF0A0D14),
          ),
          labelMedium: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFF0A0D14),
          ),
          labelSmall: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Color(0xFF0A0D14),
          ),
        ),*/

        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: false,
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF0A0D14),
        ),

        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            textStyle: WidgetStateProperty.all(
              GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      );

  static ThemeData dark = FlexThemeData.dark(
    colors: const FlexSchemeColor(
      primary: Color(0xFF9FC9FF),
      primaryContainer: Color(0xFF00325B),
      secondary: Color(0xFFFFB59D),
      secondaryContainer: Color(0xFF872100),
      tertiary: Color(0xFF86D2E1),
      tertiaryContainer: Color(0xFF004E59),
      error: Color(0xFFFFB4AB),
      errorContainer: Color(0xFFFF1A00),
    ),
  );
}

extension BuildContextTheme on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  Color get primaryColor => theme.colorScheme.primary;
  Color get errorColor => theme.colorScheme.error;
}

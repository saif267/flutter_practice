import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppTheme {
  // The defined light theme.
  static ThemeData light =
      FlexThemeData.light(
        colors: const FlexSchemeColor(
          primary: Color(0xFFA4E627),
          primaryContainer: Color(0xFFED0808),
          primaryLightRef: Color(0xFF231932),
          secondary: Color(0xFFAC3306),
          secondaryContainer: Color(0xFFFFDBCF),
          secondaryLightRef: Color(0xFFAC3306),
          tertiary: Color(0xFF2F0166),
          tertiaryContainer: Color(0xFF95F0FF),
          tertiaryLightRef: Color(0xFF2F0166),
          appBarColor: Color(0xFFFFDBCF),
          error: Color(0xFFBA1A1A),
          errorContainer: Color(0xFFFFDAD6),
        ),
        scaffoldBackground: Colors.white,
        appBarStyle: FlexAppBarStyle.scaffoldBackground,
        lightIsWhite: false,
        subThemesData: FlexSubThemesData(
          buttonPadding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10,
          ),
          scaffoldBackgroundSchemeColor: SchemeColor.surface,
          inputDecoratorBorderType: FlexInputBorderType.outline,
          inputDecoratorContentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
          inputDecoratorRadius: 10.0,
          inputDecoratorIsFilled: true,
          alignedDropdown: true,
          tooltipRadius: 4,
          tooltipSchemeColor: SchemeColor.inverseSurface,
          tooltipOpacity: 0.9,
          snackBarElevation: 6,
          snackBarBackgroundSchemeColor: SchemeColor.inverseSurface,
          appBarScrolledUnderElevation: 1.0,
          navigationRailUseIndicator: true,
          navigationRailLabelType: NavigationRailLabelType.all,
        ),
        keyColors: const FlexKeyColors(keepPrimary: true, keepTertiary: true),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
      ).copyWith(
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            foregroundColor: WidgetStateProperty.all(const Color(0xFF1B0808)),
            textStyle: WidgetStateProperty.all(
              GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ).copyWith(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,

          hintStyle: const TextStyle(
            color: Color(0xFF9E9E9E),
          ),

          prefixIconColor: const Color(0xFF9E9E9E),
          suffixIconColor: const Color(0xFF9E9E9E),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xFFE0E0E0),
              width: 1,
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xFFA4E627),
              width: 1.5,
            ),
          ),

          //  added this for error border
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xFFBA1A1A),
              width: 1,
            ),
          ),

          // added this for error border
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xFFBA1A1A),
              width: 1.5,
            ),
          ),

          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xFFE0E0E0),
              width: 1,
            ),
          ),

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
        ),

        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            foregroundColor: WidgetStateProperty.all(const Color(0xFF1B0808)),
            textStyle: WidgetStateProperty.all(
              GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      );


  // The defined dark theme.
  static ThemeData dark = FlexThemeData.dark(
    //fontFamily: GoogleFonts.kanit().fontFamily,
    colors: const FlexSchemeColor(
      // Custom colors
      primary: Color(0xFF9FC9FF),
      primaryContainer: Color(0xFF00325B),
      primaryLightRef: Color(0xFF231932),
      secondary: Color(0xFFFFB59D),
      secondaryContainer: Color(0xFF872100),
      secondaryLightRef: Color(0xFFAC3306),
      tertiary: Color(0xFF86D2E1),
      tertiaryContainer: Color(0xFF004E59),
      tertiaryLightRef: Color(0xFF2F0166),
      appBarColor: Color(0xFFFFDBCF),
      error: Color(0xFFFFB4AB),
      errorContainer: Color(0xFF93000A),
    ),
    subThemesData: const FlexSubThemesData(
      blendOnColors: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorRadius: 40.0,
      alignedDropdown: true,
      tooltipRadius: 4,
      tooltipSchemeColor: SchemeColor.inverseSurface,
      tooltipOpacity: 0.9,
      snackBarElevation: 6,
      snackBarBackgroundSchemeColor: SchemeColor.inverseSurface,
      navigationRailUseIndicator: true,
      navigationRailLabelType: NavigationRailLabelType.all,
    ),
    keyColors: const FlexKeyColors(),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
}

extension BuildContextTheme on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  Color get primaryColor => theme.colorScheme.primary;
  Color get secondaryColor => theme.colorScheme.secondary;
}

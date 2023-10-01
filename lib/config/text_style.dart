import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static String? primaryColorString = "#4263EB";
  static String? secondaryColorString = "#F5F7FE";
  static bool isLightTheme = true;

  static ThemeData getTheme() {
    if (isLightTheme) {
      return lightTheme();
    } else {
      return darkTheme();
    }
  }

  static TextTheme _buildTextTheme( TextTheme base ) {
    return base.copyWith(
      titleLarge: GoogleFonts.manrope( textStyle: TextStyle( color: base.titleLarge!.color, fontSize: 20, fontWeight: FontWeight.w500 ) ),
      titleMedium: GoogleFonts.manrope(textStyle: TextStyle(color: base.titleMedium!.color, fontSize: 18)),
      titleSmall: GoogleFonts.manrope(textStyle: TextStyle(color: base.titleSmall!.color, fontSize: 14, fontWeight: FontWeight.w500)),
      bodyMedium: GoogleFonts.manrope(textStyle: TextStyle(color: base.bodyMedium!.color, fontSize: 16)),
      bodyLarge: GoogleFonts.manrope(textStyle: TextStyle(color: base.bodyLarge!.color, fontSize: 14)),
      labelLarge: GoogleFonts.manrope(textStyle: TextStyle(color: base.labelLarge!.color, fontSize: 14, fontWeight: FontWeight.w500)),
      bodySmall: GoogleFonts.manrope(textStyle: TextStyle(color: base.bodySmall!.color, fontSize: 12)),
      headlineMedium: GoogleFonts.manrope(textStyle: TextStyle(color: base.headlineMedium!.color, fontSize: 34)),
      displaySmall: GoogleFonts.manrope(textStyle: TextStyle(color: base.displaySmall!.color, fontSize: 48)),
      displayMedium: GoogleFonts.manrope(textStyle: TextStyle(color: base.displayMedium!.color, fontSize: 60)),
      displayLarge: GoogleFonts.manrope(textStyle: TextStyle(color: base.displayLarge!.color, fontSize: 96)),
      headlineSmall: GoogleFonts.manrope(textStyle: TextStyle(color: base.headlineSmall!.color, fontSize: 24)),
      labelSmall: GoogleFonts.manrope(textStyle: TextStyle(color: base.labelSmall!.color, fontSize: 10)),
    );
  }

  static ThemeData lightTheme() {
    Color primaryColor = HexColor( primaryColorString! );
    Color secondaryColor = HexColor(secondaryColorString!);
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );

    final ThemeData base = ThemeData.light();

    return base.copyWith(
      appBarTheme: const AppBarTheme(color: Colors.white),
      popupMenuTheme: const PopupMenuThemeData(color: Colors.white),
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      // buttonColor: primaryColor,
      splashColor: Colors.white.withOpacity(0.1),
      hoverColor: Colors.transparent,
      splashFactory: InkRipple.splashFactory,
      highlightColor: Colors.transparent,
      hintColor: primaryColor, // accentColor
      canvasColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      // backgroundColor: Colors.white,
      // errorColor: Colors.red,
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.textTheme),
      platform: TargetPlatform.iOS,
      indicatorColor: primaryColor,
      disabledColor: HexColor("#D5D7D8"),
    );

  }

  static ThemeData darkTheme() {
    Color primaryColor = HexColor(primaryColorString!);
    Color secondaryColor = HexColor(secondaryColorString!);
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      popupMenuTheme: const PopupMenuThemeData(color: Colors.black),
      appBarTheme: const AppBarTheme(color: Colors.black),
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      // buttonColor: primaryColor,
      indicatorColor: Colors.white,
      splashColor: Colors.white24,
      splashFactory: InkRipple.splashFactory,
      hintColor: secondaryColor, // accentColor
      canvasColor: Colors.white,
      // backgroundColor: Colors.grey[850],
      scaffoldBackgroundColor: Colors.grey[850],
      buttonTheme: ButtonThemeData(
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      // accentTextTheme: _buildTextTheme(base.accentTextTheme),
      platform: TargetPlatform.iOS,
    );
  }

}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor"; // "FF" + hexColor
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

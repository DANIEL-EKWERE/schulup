import 'package:flutter/material.dart';
import '../core/app_export.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.

// ignore_for_file: must_be_immutable
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

  // A map of custom color themes supported by the app
  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors(),
  };

  // A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme,
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    PrefUtils().setThemeData(_newTheme);
    Get.forceAppUpdate();
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: appTheme.indigoA700,
          side: BorderSide(
            color: appTheme.whiteA700.withValues(alpha: 0.5),
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.h),
          ),
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
          padding: EdgeInsets.zero,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.indigoA700,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.h),
          ),
          elevation: 0,
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 36,
        space: 36,
        color: colorScheme.primary.withValues(alpha: 0.15),
      ),
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
    bodyLarge: TextStyle(
      color: colorScheme.secondaryContainer,
      fontSize: 16.fSize,
      fontFamily: 'Nexa Text-Trial',
      fontWeight: FontWeight.w200,
    ),
    bodyMedium: TextStyle(
      color: colorScheme.secondaryContainer,
      fontSize: 15.fSize,
      fontFamily: 'Nexa Text-Trial',
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: colorScheme.secondaryContainer,
      fontSize: 11.fSize,
      fontFamily: 'Nexa Text-Trial',
      fontWeight: FontWeight.w400,
    ),
    displaySmall: TextStyle(
      color: appTheme.indigoA700,
      fontSize: 36.fSize,
      fontFamily: 'Nexa Text-Trial',
      fontWeight: FontWeight.w700,
    ),
    headlineLarge: TextStyle(
      color: colorScheme.secondaryContainer,
      fontSize: 32.fSize,
      fontFamily: 'Nexa Text-Trial',
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: TextStyle(
      color: appTheme.indigoA700,
      fontSize: 24.fSize,
      fontFamily: 'Nexa Text-Trial',
      fontWeight: FontWeight.w700,
    ),
    labelSmall: TextStyle(
      color: appTheme.gray700,
      fontSize: 8.fSize,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
    ),
    titleLarge: TextStyle(
      color: appTheme.whiteA700,
      fontSize: 20.fSize,
      fontFamily: 'Nexa Text-Trial',
      fontWeight: FontWeight.w400,
    ),
    titleSmall: TextStyle(
      color: appTheme.whiteA700,
      fontSize: 14.fSize,
      fontFamily: 'Nexa Text-Trial',
      fontWeight: FontWeight.w700,
    ),
  );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light(
    primary: Color(0X4C191919),
    primaryContainer: Color(0XB2000000),
    secondaryContainer: Color(0XFF191919),
    onErrorContainer: Color(0XFFE3E4E8),
    onPrimary: Color(0XFF09CF9F),
    onPrimaryContainer: Color(0XFF162B4D),
  );
}

/// Class containing custom colors for a lightCode theme.
class LightCodeColors {
  // Blue
  Color get blueA700 => Color(0XFFF6873F);

  //Color get blueA7001 => Color(0XFFFF8C42);
  // BlueGray
  Color get blueGray100 => Color(0XFFD9D9D9);
  // Gray
  Color get gray100 => Color(0XFFF5F5F5);
  Color get gray10001 => Color(0XFFF5F3F3);
  Color get gray10006 => Color(0X06F7F7F7);
  Color get gray200 => Color(0XFFEEEEEE);
  Color get gray300 => Color(0XFFE1E1E1);
  Color get gray30001 => Color(0XFFE2E0E1);
  Color get gray400 => Color(0XFFBBB4B5);
  Color get gray50 => Color(0XFFFFFEF5);
  Color get gray500 => Color(0XFF979797);
  Color get gray5001 => Color(0XFFF9F9F9);
  Color get gray600 => Color(0XFF757575);
  Color get gray60001 => Color(0XFF818181);
  Color get gray700 => Color(0XFF606161);
  Color get gray800 => Color(0XFF3C3C3C);
  // Indigo
  Color get indigoA700 => Color(0XFFFF8C42);
  // White
  Color get whiteA700 => Color(0XFFFFFFFF);
}

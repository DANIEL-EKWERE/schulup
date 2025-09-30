import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Outline button style
  static ButtonStyle get outlineGray => OutlinedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary,
    side: BorderSide(color: appTheme.gray300, width: 1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.h)),
    padding: EdgeInsets.zero,
  );
  static ButtonStyle get outlineGrayTL8 => OutlinedButton.styleFrom(
    backgroundColor: appTheme.indigoA700,
    side: BorderSide(color: appTheme.gray300, width: 1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.h)),
    padding: EdgeInsets.zero,
  );
  static ButtonStyle get outlinePrimary => OutlinedButton.styleFrom(
    backgroundColor: appTheme.whiteA700,
    side: BorderSide(
      color: theme.colorScheme.primary.withValues(alpha: 0.5),
      width: 1,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.h)),
    padding: EdgeInsets.zero,
  );
  static ButtonStyle get outlinePrimaryContainer => OutlinedButton.styleFrom(
    backgroundColor: Colors.transparent,
    side: BorderSide(
      color: theme.colorScheme.primaryContainer.withValues(alpha: 0.07),
      width: 0,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.h)),
    padding: EdgeInsets.zero,
  );
  // text button style
  static ButtonStyle get none => ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
    elevation: WidgetStateProperty.all<double>(0),
    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
    side: WidgetStateProperty.all<BorderSide>(
      BorderSide(color: Colors.transparent),
    ),
  );
}

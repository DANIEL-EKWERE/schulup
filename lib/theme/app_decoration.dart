import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import '../core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillGray => BoxDecoration(color: appTheme.gray50);
  static BoxDecoration get fillIndigoA =>
      BoxDecoration(color: appTheme.indigoA700);
  static BoxDecoration get fillWhiteA =>
      BoxDecoration(color: appTheme.whiteA700);
  // Outline decorations
  static BoxDecoration get outlinePrimary => BoxDecoration(
    border: Border.all(
      color: theme.colorScheme.primary.withValues(alpha: 0.2),
      width: 1.h,
    ),
  );
  static BoxDecoration get outlinePrimaryContainer => BoxDecoration(
    border: Border.all(
      color: theme.colorScheme.primaryContainer.withValues(alpha: 0.07),
      width: 0.5.h,
    ),
  );
  // Row decorations
  static BoxDecoration get row3 => BoxDecoration(
    image: DecorationImage(
      image: fs.Svg(ImageConstant.imgGroupGray30001),
      fit: BoxFit.fill,
    ),
  );
  static BoxDecoration get row6 => BoxDecoration(
    image: DecorationImage(
      image: fs.Svg(ImageConstant.imgGroupGray30001),
      fit: BoxFit.fill,
    ),
  );
}

class BorderRadiusStyle {
  // Custom borders
  static BorderRadius get customBorderTL20 =>
      BorderRadius.vertical(top: Radius.circular(20.h));
  // Rounded borders
  static BorderRadius get roundedBorder20 => BorderRadius.circular(20.h);
  static BorderRadius get roundedBorder30 => BorderRadius.circular(30.h);
}

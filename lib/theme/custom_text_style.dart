import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension on TextStyle {
  TextStyle get poppins {
    return copyWith(fontFamily: 'Poppins');
  }

  TextStyle get dMSans {
    return copyWith(fontFamily: 'DM Sans');
  }

  TextStyle get inter {
    return copyWith(fontFamily: 'Inter');
  }

  TextStyle get montserrat {
    return copyWith(fontFamily: 'Montserrat');
  }
}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  // Body text style
  static TextStyle get bodyLargeInterGray100 => theme.textTheme.bodyLarge!.inter
      .copyWith(color: appTheme.gray100, fontWeight: FontWeight.w400);
  static TextStyle get bodyMediumDMSansOnPrimaryContainer =>
      theme.textTheme.bodyMedium!.dMSans.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 14.fSize,
      );
  static TextStyle get bodyMediumLight =>
      theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w300);
  static TextStyle get bodyMediumLight14 => theme.textTheme.bodyMedium!
      .copyWith(fontSize: 14.fSize, fontWeight: FontWeight.w300);
  static TextStyle get bodyMediumPrimary =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary.withValues(alpha: 0.5),
        fontWeight: FontWeight.w300,
      );
  static TextStyle get bodyMediumPrimaryContainer =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primaryContainer.withValues(alpha: 0.72),
        fontSize: 14.fSize,
      );
  static TextStyle get bodyMediumPrimaryLight =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary.withValues(alpha: 0.4),
        fontSize: 14.fSize,
        fontWeight: FontWeight.w300,
      );
  static TextStyle get bodySmallExtraLight =>
      theme.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w200);
  static TextStyle get bodySmallGray500 =>
      theme.textTheme.bodySmall!.copyWith(color: appTheme.gray500);
  static TextStyle get bodySmallGray50010 => theme.textTheme.bodySmall!
      .copyWith(color: appTheme.gray500, fontSize: 10.fSize);
  static TextStyle get bodySmallGray500_1 =>
      theme.textTheme.bodySmall!.copyWith(color: appTheme.gray500);
  static TextStyle get bodySmallGray500_2 =>
      theme.textTheme.bodySmall!.copyWith(color: appTheme.gray500);
  static TextStyle get bodySmallIndigoA700 =>
      theme.textTheme.bodySmall!.copyWith(color: appTheme.indigoA700);
  static TextStyle get bodySmallIndigoA700Light =>
      theme.textTheme.bodySmall!.copyWith(
        color: appTheme.indigoA700,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w300,
      );
  // Montserrat text style
  static TextStyle get montserratGray60001 =>
      TextStyle(
        color: appTheme.gray60001,
        fontSize: 5.fSize,
        fontWeight: FontWeight.w500,
      ).montserrat;
  // Title text style
  static TextStyle get titleSmallDMSansPrimaryContainer =>
      theme.textTheme.titleSmall!.dMSans.copyWith(
        color: theme.colorScheme.primaryContainer.withValues(alpha: 1),
        fontSize: 15.fSize,
      );
  static TextStyle get titleSmallGray50 =>
      theme.textTheme.titleSmall!.copyWith(color: appTheme.gray50);
  static TextStyle get titleSmallPoppinsGray800 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.gray800,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleSmallPrimaryContainer => theme.textTheme.titleSmall!
      .copyWith(color: theme.colorScheme.primaryContainer);
  static TextStyle get titleSmallPrimaryContainer15 =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primaryContainer.withValues(alpha: 1),
        fontSize: 15.fSize,
      );
  static TextStyle get titleSmallSecondaryContainer => theme
      .textTheme
      .titleSmall!
      .copyWith(color: theme.colorScheme.secondaryContainer);
}

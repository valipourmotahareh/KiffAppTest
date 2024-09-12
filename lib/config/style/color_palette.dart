import 'package:flutter/material.dart';

class ColorPalette {
  const ColorPalette(
      {required this.scaffoldBackgroundColor,
      required this.backgroundColor,
      required this.onTertiary,
      required this.tertiary,
      required this.surfaceColor,
      required this.onSurface,
      required this.cardColor,
      required this.errorColor,
      required this.errorBorderColor,
      this.disableContainerColor = const Color(0xffAEAEB2),
      this.pinkDebtorCardColor = const Color(0xffFFDCDC),
      required this.onError,
      required this.purple,
      required this.onBackgroundColor,
      required this.textPrimaryColor,
      required this.textSecondaryColor,
      required this.iconColor,
      required this.lightPurple,
      required this.dividerColor,
      required this.disableColor,
      required this.disableIcon,
      required this.hintColor});

  final Color primaryColor = const Color(0xff0f1620);
  final Color primaryDarkColor = const Color(0xffFFCC00);
  final Color onPrimaryColor = Colors.white;
  final Color secondaryContainer = const Color(0xff2463c0);
  final Color onSecondaryContainer = Colors.white;
  final Color onTertiary;
  final Color tertiary;
  final Color scaffoldBackgroundColor;
  final Color backgroundColor;
  final Color surfaceColor;
  final Color disableContainerColor;
  final Color onSurface;
  final Color cardColor;
  final Color errorColor;
  final Color errorBorderColor;
  final Color onError;
  final Color lightPurple;
  final Color purple;
  final Color pinkDebtorCardColor;
  final Color onBackgroundColor;
  final Color textPrimaryColor;
  final Color textSecondaryColor;
  final Color iconColor;
  final Color dividerColor;
  final Color disableColor;
  final Color disableIcon;
  final Color hintColor;
  final Color blue = const Color(0xff426585);
  final Color grey500 = const Color(0xff5C5C5C);
  final Color grey400 = const Color(0xff999999);
  final Color grey300 = const Color(0xff999999);
  final Color grey200 = const Color(0xffC6C6C8);
  final Color lightBlue = const Color(0xff007AFF);

  static ColorPalette light = ColorPalette(
      scaffoldBackgroundColor: const Color(0xffFAFBFC),
      backgroundColor: Colors.white,
      onTertiary: Colors.black,
      pinkDebtorCardColor: const Color(0xffFFDCDC),
      tertiary: const Color(0xffE5E5EA),
      surfaceColor: const Color(0xffF8F8FB),
      // onSurface: const Color(0xff3C3C43).withOpacity(0.6),
      //todo onSurface color conflicted with text colors
      onSurface: Colors.black,
      cardColor: Colors.white,
      lightPurple: const Color(0xffF9F5FF),
      purple: const Color(0xff6941C6),
      errorColor: const Color(0xffFF453A),
      errorBorderColor: const Color(0xffFF3B30),
      onError: const Color(0xffFFF9DC),
      onBackgroundColor: const Color(0xffF2F2F7),
      textPrimaryColor: Colors.black,
      textSecondaryColor: const Color(0xff3C3C43),
      iconColor: const Color(0xff8E8E93),
      disableColor: const Color(0xff8E8E93),
      hintColor: const Color(0xff8E8E93).withOpacity(0.6),
      dividerColor: const Color(0xffE5E5EA),
      disableIcon: const Color(0xff999999));

  factory ColorPalette.of(context) {
    return light;
  }
}

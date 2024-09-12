import 'package:flutter/material.dart';
import 'package:kiff_app_test/config/constant/assets.dart';
import 'package:kiff_app_test/config/constant/dimens.dart';
import 'package:kiff_app_test/config/style/color_palette.dart';

class KiffAppTheme{
  static ThemeData darkTheme = ThemeData(
    fontFamily: Assets.sfPro,
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: ColorPalette.light.primaryColor,
    cardColor: ColorPalette.light.cardColor,
    disabledColor: ColorPalette.light.disableColor,
    hintColor: ColorPalette.light.hintColor,
    badgeTheme: BadgeThemeData(backgroundColor: ColorPalette.light.errorColor),
    scaffoldBackgroundColor: ColorPalette.light.scaffoldBackgroundColor,
    dividerColor: ColorPalette.light.dividerColor,
    dialogBackgroundColor: ColorPalette.light.backgroundColor,
    colorScheme: ColorScheme(
      onTertiary: ColorPalette.light.onTertiary,
      tertiary: ColorPalette.light.tertiary,
      secondaryContainer: ColorPalette.light.secondaryContainer,
      onSecondaryContainer: ColorPalette.light.onSecondaryContainer,
      brightness: Brightness.light,
      primary: ColorPalette.light.primaryColor,
      onPrimary: ColorPalette.light.onPrimaryColor,
      secondary: ColorPalette.light.secondaryContainer,
      onSecondary: ColorPalette.light.onSecondaryContainer,
      error: ColorPalette.light.errorColor,
      onError: ColorPalette.light.onError,
      surface: ColorPalette.light.surfaceColor,
      onSurface: ColorPalette.light.onSurface,
    ),
    popupMenuTheme: PopupMenuThemeData(color: ColorPalette.light.cardColor),
    textTheme: TextTheme(
      labelSmall: TextStyle(
        letterSpacing: -0.4,
        fontFamily: Typography.whiteCupertino.labelSmall?.fontFamily,
      ),
      labelLarge: TextStyle(
          fontFamily: Typography.whiteCupertino.labelLarge?.fontFamily,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.4,
          color: ColorPalette.light.textPrimaryColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: WidgetStateProperty.all(
              const Size(Dimens.minWidthButton, Dimens.minHeightButton)),
          backgroundColor:
          WidgetStateProperty.all(ColorPalette.light.onPrimaryColor),
          overlayColor: WidgetStateProperty.resolveWith(
                  (states) => states.contains(WidgetState.disabled)
                  ? Colors.transparent
                  : states.contains(WidgetState.pressed)
                  ? ColorPalette.light.onPrimaryColor.withOpacity(0.6)
                  : ColorPalette.light.onPrimaryColor.withOpacity(0.1)),
          foregroundColor:
          WidgetStateProperty.all(ColorPalette.light.primaryColor),
          elevation: WidgetStateProperty.all(0),
        )),
  );

  //todo dark theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: ColorPalette.light.primaryColor,
    scaffoldBackgroundColor: ColorPalette.light.scaffoldBackgroundColor,
  );
}
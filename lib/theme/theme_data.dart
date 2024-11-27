import 'package:flutter/material.dart';

import 'custom_text_style.dart';
import 'light_theme_colors.dart';

final theme = ThemeData(
  fontFamily: 'Roboto',
  popupMenuTheme: PopupMenuThemeData(
    color: LightThemeColors.backgroundWhite,
    textStyle: CustomTextStyle.body14Regular,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) {
          return LightThemeColors.generalPrimaryDisabled;
        }
        return LightThemeColors.generalPrimary;
      }),
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
  ),
);

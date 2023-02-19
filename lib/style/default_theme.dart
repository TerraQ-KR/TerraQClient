import 'package:flutter/material.dart';

import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/utils/font_utils.dart';

final ThemeData defaultTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: ColorUtils.primary,
    secondary: ColorUtils.subBlue,
    surface: Colors.white,
    background: ColorUtils.grey10,
    error: ColorUtils.error,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    onBackground: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        fontFamily: FontUtils.primary),
    titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: FontUtils.primary),
    bodyMedium: TextStyle(fontSize: 14, fontFamily: FontUtils.primary),
    bodySmall: TextStyle(fontSize: 12, fontFamily: FontUtils.primary),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
  ),
  buttonTheme: const ButtonThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
  ),
);

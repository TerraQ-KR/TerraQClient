import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/utils/font_utils.dart';

final ThemeData questTheme = ThemeData(
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: ColorUtils.black,
      fontSize: 16,
      fontFamily: FontUtils.primary,
    ),
    bodyMedium: TextStyle(
      fontFamily: FontUtils.primary,
      fontSize: 14,
      color: ColorUtils.white,
      fontWeight: FontWeight.bold,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: ColorUtils.subBlue,
      minimumSize: const Size.fromHeight(40),
      elevation: 0.0,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    fillColor: ColorUtils.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
  ),
);

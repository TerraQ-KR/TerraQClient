import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/utils/font_utils.dart';

final ThemeData detailTheme = ThemeData(
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontFamily: FontUtils.primary,
      fontSize: 18,
      color: ColorUtils.white,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      color: ColorUtils.white,
      fontSize: 14,
      fontFamily: FontUtils.primary,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      color: ColorUtils.black,
      fontSize: 24,
      fontFamily: FontUtils.primary,
      fontWeight: FontWeight.w900,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: ColorUtils.subBlue,
      minimumSize: const Size.fromHeight(40),
      elevation: 0.0,
    ),
  ),
);

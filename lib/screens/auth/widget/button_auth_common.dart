import 'package:flutter/material.dart';

import 'package:eco_reward_app/utils/font_utils.dart';
import 'package:eco_reward_app/utils/color_utils.dart';

class ButtonAuthCommon extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const ButtonAuthCommon(
      {required this.text, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        backgroundColor: ColorUtils.primary,
        minimumSize: const Size.fromHeight(50),
        elevation: 0.0,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: FontUtils.primary,
            fontSize: 18,
            color: ColorUtils.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

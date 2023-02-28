import 'package:flutter/material.dart';

import 'package:eco_reward_app/utils/font_utils.dart';
import 'package:eco_reward_app/utils/color_utils.dart';

class ButtonQuestDetail extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ButtonQuestDetail(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorUtils.subBlue,
          minimumSize: const Size.fromHeight(40),
          elevation: 0.0,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: FontUtils.primary,
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

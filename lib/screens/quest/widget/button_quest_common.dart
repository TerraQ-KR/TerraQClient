import 'package:flutter/material.dart';

import 'package:eco_reward_app/utils/font_utils.dart';
import 'package:eco_reward_app/utils/color_utils.dart';

class ButtonQuest extends StatelessWidget {
  final VoidCallback onPressed;
  const ButtonQuest({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185,
      height: 30,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: ColorUtils.subBlue,
          minimumSize: const Size.fromHeight(50),
          elevation: 0.0,
        ),
        child: Text(
          '인증하기',
          style: const TextStyle(
            fontFamily: FontUtils.primary,
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

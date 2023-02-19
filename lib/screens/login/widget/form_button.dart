import 'package:flutter/material.dart';

import 'package:eco_reward_app/utils/font_utils.dart';
import 'package:eco_reward_app/utils/color_utils.dart';

class FormButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const FormButton({required this.text, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: ColorUtils.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        minimumSize: const Size.fromHeight(50),
        elevation: 0.0,
      ),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Text(
          text,
          style: TextStyle(
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

import 'package:flutter/material.dart';

import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/utils/font_utils.dart';

class ButtonAuthSocial extends StatelessWidget {
  final String text;
  const ButtonAuthSocial(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // ignore: prefer-extracting-callbacks
      onPressed: () {
        print(text);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorUtils.subBlue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        minimumSize: const Size.fromHeight(40),
        elevation: 0.0,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          'Continue with $text',
          style: const TextStyle(
            fontFamily: FontUtils.primary,
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

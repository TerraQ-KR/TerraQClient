import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/utils/font_utils.dart';

class QuestModalBox extends StatelessWidget {
  final IconData icon;
  final String text;
  const QuestModalBox({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          child: Padding(
            padding: EdgeInsets.only(left: 20),
          ),
        ),
        Icon(icon),
        const SizedBox(
          child: Padding(
            padding: EdgeInsets.only(left: 20),
          ),
        ),
        Text(
          'Sort by $text',
          style: const TextStyle(
            color: ColorUtils.black,
            fontSize: 18,
            fontFamily: FontUtils.primary,
          ),
        ),
      ],
    );
  }
}

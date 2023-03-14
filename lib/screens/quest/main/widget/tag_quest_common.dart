import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/screens/quest/main/style/main_theme.dart';

class TagQuest extends StatelessWidget {
  final String text;

  const TagQuest({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorUtils.subBlue,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: questTheme.textTheme.bodyMedium,
      ),
    );
  }
}

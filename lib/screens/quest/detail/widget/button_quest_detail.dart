import 'package:flutter/material.dart';
import 'package:eco_reward_app/screens/quest/detail/style/detail_theme.dart';

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
        style: detailTheme.elevatedButtonTheme.style,
        child: Text(
          text,
          style: detailTheme.textTheme.bodyLarge,
        ),
      ),
    );
  }
}

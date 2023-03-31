import 'package:flutter/material.dart';
import 'package:eco_reward_app/routes.dart';
import 'package:eco_reward_app/screens/quest/main/style/main_theme.dart';

class ButtonQuest extends StatelessWidget {
  final onPressed;

  const ButtonQuest({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 185,
      height: 30,
      child: Hero(
        tag: 'certification',
        child: ElevatedButton(
          onPressed: onPressed,
          style: questTheme.elevatedButtonTheme.style,
          child: Text(
            'Certification',
            style: questTheme.textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}

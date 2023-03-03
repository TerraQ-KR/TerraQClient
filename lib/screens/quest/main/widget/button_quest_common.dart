import 'package:flutter/material.dart';
import 'package:eco_reward_app/screens/quest/main/style/main_theme.dart';

class ButtonQuest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 185,
      height: 30,
      child: ElevatedButton(
        onPressed: () => navigateToCertification(context),
        style: questTheme.elevatedButtonTheme.style,
        child: Text(
          'Certification',
          style: questTheme.textTheme.bodyMedium,
        ),
      ),
    );
  }
}

Future<void> navigateToCertification(context) async {
  Navigator.pushNamed(context, '/quest/certification');
}

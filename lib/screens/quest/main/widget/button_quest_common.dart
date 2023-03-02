import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/screens/quest/main/style/main_theme.dart';

class ButtonQuest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 185,
      height: 30,
      child: ElevatedButton(
        onPressed: () => navigateToCertification(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorUtils.subBlue,
          minimumSize: const Size.fromHeight(50),
          elevation: 0.0,
        ),
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

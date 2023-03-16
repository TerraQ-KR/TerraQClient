import 'package:flutter/material.dart';
import 'package:eco_reward_app/screens/quest/main/style/main_theme.dart';
import 'package:eco_reward_app/screens/quest/certification/utils/certificate_modal.dart';
import 'package:eco_reward_app/screens/quest/certification/quest_image_screen.dart';

class ButtonQuest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 185,
      height: 30,
      child: ElevatedButton(
        onPressed: () => CertificateModal().regulation(context),
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
  Navigator.push(context,
      new MaterialPageRoute(builder: (context) => new QuestImageScreen()));
}

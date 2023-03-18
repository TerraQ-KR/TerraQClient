import 'package:flutter/material.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/button_quest_detail.dart';
import 'package:eco_reward_app/screens/quest/certification/utils/certificate_modal.dart';

class QuestDescriptionBox extends StatelessWidget {
  final String information;

  const QuestDescriptionBox({super.key, required this.information});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          // ignore: prefer-const-border-radius
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              information,
            ),
            ButtonQuestDetail(
                text: 'Certification',
                onPressed: () =>
                    _navigateToCertificateScreen(context, information)),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

_navigateToCertificateScreen(context, information) async {
  return Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => CertificateModal(information: information)),
  );
}

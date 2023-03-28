import 'package:flutter/material.dart';
import 'package:eco_reward_app/routes.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/button_quest_detail.dart';

class QuestDescriptionBox extends StatelessWidget {
  final int questId;
  final String questName;
  final double reward;
  final String information;

  const QuestDescriptionBox(
      {super.key,
      required this.questId,
      required this.questName,
      required this.reward,
      required this.information});

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
            Container(
              margin: const EdgeInsets.all(30),
              child: Text(
                information,
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: ButtonQuestDetail(
                  text: 'Certification',
                  onPressed: () =>
                      _navigateToCertificateScreen(context, questId)),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

_navigateToCertificateScreen(context, id) async {
  return Navigator.pushNamed(
      context,
      RouteParams(
          path: Routes.questcertificationmodal,
          queryParameters: {'qid': id.toString()}));
}

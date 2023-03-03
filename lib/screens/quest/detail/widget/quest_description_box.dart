import 'package:flutter/material.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/button_quest_detail.dart';

class QuestDescriptionBox extends StatelessWidget {
  const QuestDescriptionBox({super.key});

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
            const Text('''
              Requirements 
              for achieving quests 

              blablabla

              Quest Detail Description

              Detail ~~

              ~~
              ㅇㅇㅇㅇ
              '''),
            ButtonQuestDetail(
              text: 'Certification',
              onPressed: () => {},
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

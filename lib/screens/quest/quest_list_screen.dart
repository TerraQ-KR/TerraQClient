import 'package:flutter/material.dart';

import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/screens/quest/widget/input_quest_common.dart';

class QuestListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [ColorUtils.subOrange, ColorUtils.primary]),
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 30),
            Center(child: InputQuest()),
            const SizedBox(height: 20),
            Center(child: InputQuest()),
          ],
        ),
      ),
    );
  }
}

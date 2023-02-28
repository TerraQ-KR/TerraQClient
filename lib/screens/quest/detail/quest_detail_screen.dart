import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/quest_description_box.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/quest_infrom_box.dart';

class QuestDetailScreen extends StatefulWidget {
  @override
  State<QuestDetailScreen> createState() => _QuestDetailScreen();
}

class _QuestDetailScreen extends State<QuestDetailScreen> {
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
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: <Widget>[
                        QuestInformBox(),
                        const SizedBox(height: 20),
                        QuestDescriptionBox(),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/screens/quest/main/widget/input_quest_picture.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/tool_bar.dart';

class QuestListScreen extends StatefulWidget {
  @override
  State<QuestListScreen> createState() => _QuestListScreenState();
}

class _QuestListScreenState extends State<QuestListScreen> {
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
            children: [
              const SizedBox(height: 20),
              ToolBar(),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 20),
                      Center(child: InputQuestPicture()),
                      const SizedBox(height: 20),
                      Center(child: InputQuestPicture()),
                      const SizedBox(height: 20),
                      Center(child: InputQuestPicture()),
                      const SizedBox(height: 20),
                      Center(child: InputQuestPicture()),
                      const SizedBox(height: 20),
                      Center(child: InputQuestPicture()),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:eco_reward_app/screens/quest/main/widget/input_quest_picture.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/toolbar_quest.dart';

class QuestListScreen extends StatefulWidget {
  @override
  State<QuestListScreen> createState() => _QuestListScreenState();
}

class _QuestListScreenState extends State<QuestListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          const SizedBox(height: 20),
          ToolbarQuest(),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 20),
                    InputQuestPicture(),
                    const SizedBox(height: 20),
                    InputQuestPicture(),
                    const SizedBox(height: 20),
                    InputQuestPicture(),
                    const SizedBox(height: 20),
                    InputQuestPicture(),
                    const SizedBox(height: 20),
                    InputQuestPicture(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

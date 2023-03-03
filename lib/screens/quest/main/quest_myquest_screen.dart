import 'package:flutter/material.dart';
import 'package:eco_reward_app/screens/quest/main/widget/input_quest_common.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/toolbar_quest.dart';

class MyQuestScreen extends StatefulWidget {
  @override
  State<MyQuestScreen> createState() => _MyQuestScreenState();
}

class _MyQuestScreenState extends State<MyQuestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            ToolbarQuest(),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 20),
                    InputQuest(),
                    const SizedBox(height: 20),
                    InputQuest(),
                    const SizedBox(height: 20),
                    InputQuest(),
                    const SizedBox(height: 20),
                    InputQuest(),
                    const SizedBox(height: 20),
                    InputQuest(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

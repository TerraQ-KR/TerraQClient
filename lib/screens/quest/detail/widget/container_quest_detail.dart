import 'package:flutter/material.dart';
import 'package:eco_reward_app/screens/quest/detail/style/detail_theme.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/quest_description_box.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/quest_infrom_box.dart';
import 'package:eco_reward_app/screens/quest/main/widget/tag_quest_people.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/tag_quest_foot.dart';

class ContainerQuestDetail extends StatelessWidget {
  final String questName;
  final String briefing;
  final String information;

  const ContainerQuestDetail(
      {super.key,
      required this.questName,
      required this.briefing,
      required this.information});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Text(
              questName,
              style: detailTheme.textTheme.titleMedium,
            ),
          ),
          Row(
            children: [
              const Padding(padding: EdgeInsets.all(20), child: TagQuestFoot()),
              TagQuestPeople(quest_user_count: 100),
            ],
          ),
          QuestInformBox(),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: QuestDescriptionBox(
              information: information,
            ),
          ),
        ],
      ),
    );
  }
}

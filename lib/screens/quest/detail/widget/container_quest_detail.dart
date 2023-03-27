import 'package:flutter/material.dart';
import 'package:eco_reward_app/screens/quest/detail/style/detail_theme.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/quest_description_box.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/quest_infrom_box.dart';
import 'package:eco_reward_app/screens/quest/main/widget/tag_quest_people.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/tag_quest_foot.dart';

class ContainerQuestDetail extends StatelessWidget {
  final String questName;
  final String startDate;
  final String endDate;
  final String information;
  final double reward;
  final int challenger;

  const ContainerQuestDetail({
    Key? key,
    required this.questName,
    required this.startDate,
    required this.endDate,
    required this.information,
    required this.reward,
    required this.challenger,
  }) : super(key: key);

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
              Padding(
                  padding: EdgeInsets.all(20),
                  child: TagQuestFoot(
                    reward: reward.toString(),
                  )),
              TagQuestPeople(quest_user_count: challenger),
            ],
          ),
          QuestInformBox(
            startDate: startDate,
            endDate: endDate,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            margin: const EdgeInsets.only(top: 20),
            child: QuestDescriptionBox(
              questName: questName,
              reward: reward,
              information: information,
            ),
          ),
        ],
      ),
    );
  }
}

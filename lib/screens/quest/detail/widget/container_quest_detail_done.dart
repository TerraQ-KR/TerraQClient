import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/screens/quest/detail/style/detail_theme.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/quest_infrom_box.dart';
import 'package:eco_reward_app/screens/quest/main/widget/tag_quest_people.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/tag_quest_foot.dart';

class ContainerQuestDetailDone extends StatelessWidget {
  final String questName;
  final String startDate;
  final String endDate;

  const ContainerQuestDetailDone({
    Key? key,
    required this.questName,
    required this.startDate,
    required this.endDate,
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
          const Row(
            children: [
              Padding(padding: EdgeInsets.all(20), child: TagQuestFoot()),
              TagQuestPeople(quest_user_count: 100),
            ],
          ),
          QuestInformBox(
            startDate: startDate,
            endDate: endDate,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: FractionallySizedBox(
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
                      'Certificate Image',
                    ),
                    Container(
                      height: 200,
                      width: 200,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        // ignore: prefer-const-border-radius
                        borderRadius: BorderRadius.circular(15),
                      ),
                      alignment: Alignment.center,
                    ),
                    const SizedBox(height: 20),
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

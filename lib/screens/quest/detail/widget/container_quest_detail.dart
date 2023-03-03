import 'package:flutter/material.dart';
import 'package:eco_reward_app/screens/quest/detail/style/detail_theme.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/quest_description_box.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/quest_infrom_box.dart';
import 'package:eco_reward_app/screens/quest/main/widget/tag_quest_people.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/tag_quest_foot.dart';

class ContainerQuestDetail extends StatefulWidget {
  const ContainerQuestDetail({super.key});

  @override
  State<ContainerQuestDetail> createState() => _ContainerQuestDetail();
}

class _ContainerQuestDetail extends State<ContainerQuestDetail> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Text(
              'Quest name ~~',
              style: detailTheme.textTheme.titleMedium,
            ),
          ),
          Row(
            children: [
              const Padding(padding: EdgeInsets.all(20), child: TagQuestFoot()),
              TagQuestPeople(),
            ],
          ),
          QuestInformBox(),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: QuestDescriptionBox(),
          ),
        ],
      ),
    );
  }
}

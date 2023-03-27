import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:eco_reward_app/screens/quest/detail/style/detail_theme.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/quest_infrom_box.dart';
import 'package:eco_reward_app/screens/quest/main/widget/tag_quest_people.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/tag_quest_foot.dart';

class ContainerQuestDetailDone extends HookWidget {
  final int id;
  final String questName;
  final String startDate;
  final String endDate;
  final double reward;
  final int challenger;
  final List<dynamic> images;

  const ContainerQuestDetailDone({
    Key? key,
    required this.id,
    required this.questName,
    required this.startDate,
    required this.endDate,
    required this.reward,
    required this.challenger,
    required this.images,
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
                    const Text(
                      'Certified Image',
                    ),
                    // ignore: avoid-shrink-wrap-in-lists
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 200,
                          width: 200,
                          margin: const EdgeInsets.all(20),
                          alignment: Alignment.center,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child:
                                Image.network(images.elementAt(index)['image']),
                          ),
                        );
                      },
                    ),
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

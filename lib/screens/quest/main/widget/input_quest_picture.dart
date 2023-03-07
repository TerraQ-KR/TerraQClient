import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/screens/quest/main/style/main_theme.dart';
import 'package:eco_reward_app/screens/quest/main/widget/tag_quest_common.dart';
import 'package:eco_reward_app/screens/quest/main/widget/tag_quest_people.dart';
import 'package:eco_reward_app/screens/quest/main/models/t_quest.dart';

class InputQuestPicture extends StatelessWidget {
  final TQuest quest;

  const InputQuestPicture({
    Key? key,
    required this.quest,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100,
      child: FractionallySizedBox(
        widthFactor: 0.6,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorUtils.white,
              ),
              child: Stack(
                children: [
                  Container(
                    alignment: const Alignment(-0.9, 0),
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  ),
                  Container(
                    alignment: const Alignment(-0.3, -0.8),
                    child: TagQuest(text: quest.categoryDto![1] ?? 'Recycle'),
                  ),
                  Container(
                    alignment: const Alignment(0.3, -0.8),
                    child:
                        TagQuestPeople(quest_user_count: quest.nowChallenger!),
                  ),
                  Container(
                    alignment: const Alignment(0.2, -0.1),
                    child: Text(
                      quest.questName!,
                      style: questTheme.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    alignment: const Alignment(0, 0.5),
                    child: Text(
                      quest.memo!,
                      style: questTheme.textTheme.bodyLarge,
                    ),
                  ),
                  Container(
                    alignment: const Alignment(0.9, -0.8),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.bookmark,
                          color: ColorUtils.subBlue, size: 30),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
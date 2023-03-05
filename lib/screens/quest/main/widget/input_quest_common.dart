import 'package:eco_reward_app/screens/quest/detail/quest_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/screens/quest/main/style/main_theme.dart';
import 'package:eco_reward_app/screens/quest/main/widget/button_quest_common.dart';
import 'package:eco_reward_app/screens/quest/main/widget/tag_quest_common.dart';
import 'package:eco_reward_app/screens/quest/main/widget/tag_quest_people.dart';

class InputQuest extends StatelessWidget {
  final String subCategoryName;
  final String questName;
  final String memo;
  final int challenger;

  const InputQuest({
    Key? key,
    required this.subCategoryName,
    required this.questName,
    required this.memo,
    required this.challenger,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 150,
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
                    alignment: const Alignment(0.8, 0.8),
                    child: ButtonQuest(),
                  ),
                  Container(
                    alignment: const Alignment(-0.8, -0.8),
                    child: TagQuest(text: subCategoryName),
                  ),
                  Container(
                    alignment: const Alignment(-0.2, -0.8),
                    child: TagQuestPeople(quest_user_count: challenger),
                  ),
                  Container(
                    alignment: const Alignment(-0.6, -0.3),
                    child: Text(
                      questName,
                      style: questTheme.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    alignment: const Alignment(-0.6, 0.1),
                    child: Text(
                      questName,
                      style: questTheme.textTheme.bodyLarge,
                    ),
                  ),
                  Container(
                    alignment: const Alignment(0.9, -0.8),
                    child: IconButton(
                      onPressed: () => navigateToDetail(context),
                      icon: const Icon(Icons.navigate_next, size: 45),
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

Future navigateToDetail(context) async {
  Navigator.push(context,
      new MaterialPageRoute(builder: (context) => new QuestDetailScreen()));
}

import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/screens/quest/main/style/main_theme.dart';
import 'package:eco_reward_app/screens/quest/main/widget/tag_quest_common.dart';
import 'package:eco_reward_app/screens/quest/main/widget/tag_quest_people.dart';

class InputQuestPicture extends StatelessWidget {
  final String categoryName;
  final String subCategoryName;
  final String questName;
  final int reward;
  final String memo;
  final int timeLimit;

  const InputQuestPicture({
    Key? key,
    required this.categoryName,
    required this.subCategoryName,
    required this.questName,
    required this.reward,
    required this.memo,
    required this.timeLimit,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      height: 100,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 360,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorUtils.white,
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 10,
                  top: 15,
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                ),
                Positioned(
                  left: 90,
                  top: 10,
                  child: TagQuest(text: subCategoryName),
                ),
                Positioned(
                  left: 170,
                  top: 10,
                  child: TagQuestPeople(quest_user_count: 100),
                ),
                Positioned(
                  left: 90,
                  top: 35,
                  child: Text(
                    questName,
                    style: questTheme.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  left: 90,
                  bottom: 15,
                  child: SizedBox(
                    width: 250,
                    height: 20,
                    child: Text(
                      memo,
                      style: questTheme.textTheme.bodyLarge,
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
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
    );
  }
}

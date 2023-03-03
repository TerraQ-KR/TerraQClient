import 'package:eco_reward_app/screens/quest/detail/quest_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/screens/quest/main/style/main_theme.dart';
import 'package:eco_reward_app/screens/quest/main/widget/button_quest_common.dart';
import 'package:eco_reward_app/screens/quest/main/widget/tag_quest_common.dart';
import 'package:eco_reward_app/screens/quest/main/widget/tag_quest_people.dart';

class InputQuest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      height: 130,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 360,
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorUtils.white,
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 165,
                  top: 90,
                  child: ButtonQuest(),
                ),
                const Positioned(
                  left: 10,
                  top: 10,
                  child: TagQuest(text: 'Recycle'),
                ),
                Positioned(
                  left: 90,
                  top: 10,
                  child: TagQuestPeople(),
                ),
                Positioned(
                  left: 20,
                  top: 40,
                  child: SizedBox(
                    width: 250,
                    height: 45,
                    child: Text(
                      "Quest name ~~",
                      style: questTheme.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 69,
                  child: SizedBox(
                    width: 250,
                    height: 21,
                    child: Text(
                      'Quest description ~~',
                      style: questTheme.textTheme.bodyLarge,
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
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
    );
  }
}

Future navigateToDetail(context) async {
  Navigator.push(context,
      new MaterialPageRoute(builder: (context) => new QuestDetailScreen()));
}

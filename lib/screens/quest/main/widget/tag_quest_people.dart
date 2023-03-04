import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/screens/quest/main/style/main_theme.dart';

class TagQuestPeople extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final int quest_user_count;

  const TagQuestPeople({Key? key, required this.quest_user_count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String countText;
    countText = quest_user_count < 1000 ? quest_user_count.toString() : '999+';
    // ignore: newline-before-return
    return Container(
      width: 80,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.transparent,
        border: const Border.fromBorderSide(
            BorderSide(color: ColorUtils.grey04, width: 2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.person, size: 20),
          Text(
            countText,
            textAlign: TextAlign.center,
            style: questTheme.textTheme.bodyMedium!
                .copyWith(color: ColorUtils.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

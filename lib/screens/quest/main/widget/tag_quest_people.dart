import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/screens/quest/main/style/main_theme.dart';

class TagQuestPeople extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            "999+",
            textAlign: TextAlign.center,
            style: questTheme.textTheme.bodyMedium!
                .copyWith(color: ColorUtils.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/screens/quest/detail/style/detail_theme.dart';

class TagQuestFoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorUtils.subBlue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.assist_walker, size: 20),
          Text("500Km",
              textAlign: TextAlign.center,
              style: detailTheme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}

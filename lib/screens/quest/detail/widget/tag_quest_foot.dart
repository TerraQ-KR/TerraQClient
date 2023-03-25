import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/screens/quest/detail/style/detail_theme.dart';

class TagQuestFoot extends StatelessWidget {
  const TagQuestFoot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 20,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
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

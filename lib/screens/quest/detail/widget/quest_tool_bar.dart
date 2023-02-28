import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/utils/font_utils.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/quest_icon_button.dart';

class QuestToolBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: () => navigateToStatus(context),
          icon: const Icon(Icons.all_inbox, color: ColorUtils.black, size: 20),
          label: const Text(
            'Gallery',
            style: TextStyle(
              color: ColorUtils.black,
              fontSize: 18,
              fontFamily: FontUtils.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorUtils.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        const SizedBox(width: 100),
        QuestIconButton(
          icon: Icons.search,
          onPressed: () => {},
        ),
        QuestIconButton(
          icon: Icons.sort,
          onPressed: () => {},
        ),
        QuestIconButton(
          icon: Icons.alarm,
          onPressed: () => {},
        ),
      ],
    );
  }
}

Future<Future<Object?>> navigateToStatus(context) async {
  return Navigator.pushNamed(context, '/quest/gallery');
}

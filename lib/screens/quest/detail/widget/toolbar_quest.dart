import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/utils/font_utils.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/quest_icon_button.dart';
import 'package:eco_reward_app/screens/quest/detail/utils/modal_utils.dart';

class ToolbarQuest extends StatefulWidget {
  @override
  State<ToolbarQuest> createState() => _ToolbarQuest();
}

class _ToolbarQuest extends State<ToolbarQuest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            onPressed: () => navigateToStatus(context),
            icon: const Icon(Icons.image, color: ColorUtils.black, size: 20),
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
          Row(
            children: [
              QuestIconButton(
                icon: Icons.search,
                onPressed: () => {},
              ),
              QuestIconButton(
                icon: Icons.sort,
                onPressed: () => ModalUtils().sortMyQuest(context),
              ),
              QuestIconButton(
                icon: Icons.alarm,
                onPressed: () => {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Future<Future<Object?>> navigateToStatus(context) async {
  return Navigator.pushNamed(context, '/quest/gallery');
}

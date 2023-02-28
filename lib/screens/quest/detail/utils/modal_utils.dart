import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/utils/font_utils.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/quest_modal_box.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/button_quest_confirm.dart';

class ModalUtils {
  Future sortMyQuest(context) async {
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: 250,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  'Please select the sort order.',
                  style: TextStyle(
                    color: ColorUtils.black,
                    fontSize: 18,
                    fontFamily: FontUtils.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: QuestModalBox(
                  icon: Icons.check_circle_outline_rounded,
                  text: 'Date',
                ),
              ),
              const QuestModalBox(
                icon: Icons.check_circle_outline_rounded,
                text: 'Category',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ButtonQuestConfirm(),
              ),
            ],
          ),
        );
      },
    );
  }
}

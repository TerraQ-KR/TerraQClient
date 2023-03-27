import 'package:flutter/material.dart';
import 'package:eco_reward_app/routes.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/utils/font_utils.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/button_quest_detail.dart';
import 'package:eco_reward_app/screens/quest/certification/quest_image_screen.dart';

class CertificateModal extends StatelessWidget {
  final String questName;
  final double reward;
  final String information;

  const CertificateModal(
      {super.key,
      required this.questName,
      required this.reward,
      required this.information});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(top: 20, right: 20),
              child: IconButton(
                  onPressed: () => _navigateToBefore(context),
                  icon: const Icon(Icons.close,
                      color: ColorUtils.black, size: 30)),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 40),
              child: Text(
                'Certification Regulations',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorUtils.black,
                  fontSize: 18,
                  fontFamily: FontUtils.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 20),
              child: Text(information,
                  style: const TextStyle(
                    color: ColorUtils.black,
                    fontSize: 14,
                    fontFamily: FontUtils.primary,
                    fontWeight: FontWeight.w400,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ButtonQuestDetail(
                text: 'Confirm',
                onPressed: () => _navigateToImage(context, questName, reward),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_navigateToImage(context, questName, reward) async {
  return Navigator.pushNamed(
    context,
    Routes.questimage,
    arguments: QuestImageScreen(
      questName: questName,
      reward: reward,
    ),
  );
}

_navigateToBefore(context) async {
  return Navigator.pop(context);
}

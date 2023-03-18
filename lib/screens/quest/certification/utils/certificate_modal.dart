import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/utils/font_utils.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/button_quest_detail.dart';
import 'package:eco_reward_app/screens/quest/certification/quest_image_screen.dart';

class CertificateModal extends StatelessWidget {
  final information;

  const CertificateModal({this.information});

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
                  icon: Icon(Icons.close, color: ColorUtils.black, size: 30)),
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
            Text(information,
                style: TextStyle(
                  color: ColorUtils.black,
                  fontSize: 14,
                  fontFamily: FontUtils.primary,
                  fontWeight: FontWeight.w400,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ButtonQuestDetail(
                text: 'Confirm',
                onPressed: () => _navigateToImage(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_navigateToImage(context) async {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const QuestImageScreen()),
  );
}

_navigateToBefore(context) async {
  return Navigator.pop(context);
}

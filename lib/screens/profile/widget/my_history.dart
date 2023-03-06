import 'package:eco_reward_app/screens/profile/components/personalComponents.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:flutter/material.dart';

class PersonalHistory extends StatelessWidget {
  const PersonalHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: ColorUtils.white,
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 10),
            Flexible(
              flex: 1,
              child: PersonalComponent(
                navigatePath: "/mypage/",
                componentIcon: Icons.keyboard_double_arrow_up_rounded,
                componentText: "My Ranking",
              ),
            ),
            Flexible(
              flex: 1,
              child: PersonalComponent(
                navigatePath: "/mypage/test",
                componentIcon: Icons.shield_moon,
                componentText: "My Badge",
              ),
            ),
            Flexible(
              flex: 1,
              child: PersonalComponent(
                navigatePath: "/mypage/",
                componentIcon: Icons.auto_graph_rounded,
                componentText: "Report",
              ),
            ),
            SizedBox(height: 10),
          ],
        ));
  }
}

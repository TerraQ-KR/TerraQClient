import 'package:eco_reward_app/routes.dart';
import 'package:eco_reward_app/screens/profile/components/personalComponents.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:eco_reward_app/screens/profile/constants/profile_icons.dart';

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
                  navigatePath: Routes.leaderboard,
                  componentIcon: ProfileIcons.arrows,
                  componentText: "Leaderboard",
                  angle: -1.5707963267948966192313216916398),
            ),
            Divider(
              color: ColorUtils.grey05,
              height: 1.3,
            ),
            Flexible(
              flex: 1,
              child: PersonalComponent(
                navigatePath: Routes.mybadges,
                componentIcon: Icons.shield_moon,
                componentText: "My Badges",
              ),
            ),
            Divider(
              color: ColorUtils.grey05,
              height: 1.3,
            ),
            Flexible(
              flex: 1,
              child: PersonalComponent(
                navigatePath: Routes.myreport,
                componentIcon: ProfileIcons.graph,
                componentText: "Report",
              ),
            ),
            SizedBox(height: 10),
          ],
        ));
  }
}

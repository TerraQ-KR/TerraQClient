import 'package:eco_reward_app/screens/profile/components/personalComponents.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:flutter/material.dart';

class InviteMember extends StatelessWidget {
  const InviteMember({
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
                navigatePath: "login",
                componentIcon: Icons.call,
                componentText: "Inquiry",
              ),
            ),
            Flexible(
              flex: 1,
              child: PersonalComponent(
                navigatePath: "login",
                componentIcon: Icons.person_add_rounded,
                componentText: "Invite",
              ),
            ),
            SizedBox(height: 10),
          ],
        ));
  }
}

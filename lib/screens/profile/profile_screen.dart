import 'package:eco_reward_app/screens/profile/widget/mainWidgets/personal_profile.dart';
import 'package:eco_reward_app/screens/profile/widget/mainWidgets/invite_member.dart';
import 'package:eco_reward_app/screens/profile/widget/mainWidgets/my_history.dart';
import 'package:eco_reward_app/screens/profile/widget/mainWidgets/personal_status.dart';
import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProfileScreen extends HookWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    double pixelHeight = deviceSize.height;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [ColorUtils.primary, ColorUtils.subBlue],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: ColorUtils.white,
        ),
        body: Padding(
          padding: EdgeInsets.all(0.017 * pixelHeight),
          child: Column(
            children: [
              const Flexible(
                flex: 3,
                child: personalProfile(),
              ),
              SizedBox(height: 0.01 * pixelHeight),
              const Flexible(
                flex: 3,
                child: personalStatus(),
              ),
              SizedBox(height: 0.017 * pixelHeight),
              const Flexible(
                flex: 6,
                child: PersonalHistory(),
              ),
              SizedBox(height: 0.017 * pixelHeight),
              const Flexible(
                flex: 4,
                child: InviteMember(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: NavigationBar(
          destinations: const [
            Text("Navigator"),
            Text(" "),
          ],
          backgroundColor: ColorUtils.white,
        ),
      ),
    );
  }
}

import 'package:eco_reward_app/screens/profile/widget/personal_profile.dart';
import 'package:eco_reward_app/screens/profile/widget/personal_status.dart';
import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: const Padding(
          padding: EdgeInsets.all(25.0),
          child: Column(
            children: [
              personalProfile(),
              personalStatus(),
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

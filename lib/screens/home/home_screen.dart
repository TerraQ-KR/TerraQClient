import 'package:eco_reward_app/screens/home/widget/section_home_category.dart';
import 'package:eco_reward_app/screens/home/widget/section_home_quest.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(30, 100, 30, 50),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: const [
              FractionallySizedBox(
                widthFactor: 1.0,
                child: SectionHomeCategory(),
              ),
              SizedBox(height: 20),
              FractionallySizedBox(
                widthFactor: 1.0,
                child: SectionHomeQuest(),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: ColorUtils.primary,
    );
  }
}

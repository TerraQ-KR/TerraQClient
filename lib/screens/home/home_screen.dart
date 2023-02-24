import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/screens/home/widget/section_home_category.dart';
import 'package:eco_reward_app/screens/home/widget/section_home_quest.dart';
import 'package:eco_reward_app/screens/home/widget/section_home_stat.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorUtils.primary,
              ColorUtils.primary.withOpacity(0.85),
              Colors.blue,
            ],
            stops: const [0, 0.6, 0.9],
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.fromLTRB(30, 70, 30, 50),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: const [
                FractionallySizedBox(
                  widthFactor: 1.0,
                  child: SectionHomeCategory(),
                ),
                FractionallySizedBox(
                  widthFactor: 1.0,
                  child: SectionHomeQuest(),
                ),
                SizedBox(height: 20),
                FractionallySizedBox(
                  widthFactor: 1.0,
                  child: SectionHomeStat(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

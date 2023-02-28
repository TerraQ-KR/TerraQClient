import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
// import 'package:eco_reward_app/screens/quest/gallery/widget/quest_image.dart';

class QuestGalleryScreen extends StatelessWidget {
  const QuestGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [ColorUtils.subOrange, ColorUtils.primary]),
        ),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                return DottedBorder(
                  color: Colors.white,
                  child: Container(
                    color: ColorUtils.grey05,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

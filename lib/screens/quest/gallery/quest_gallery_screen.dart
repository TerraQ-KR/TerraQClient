import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
// import 'package:eco_reward_app/screens/quest/gallery/widget/quest_image.dart';

class QuestGalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quest Status'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [ColorUtils.subOrange, ColorUtils.primary]),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.fromLTRB(30, 30, 30, 30),
              child: GridView.count(
                  padding: const EdgeInsets.all(10),
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  children: List.generate(
                    4,
                    (index) => DottedBorder(
                      color: ColorUtils.black,
                      strokeWidth: 1,
                      child: Container(
                        color: ColorUtils.white,
                        child: const Center(
                          child: Text(
                            'No Image',
                            style: TextStyle(
                              color: ColorUtils.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}

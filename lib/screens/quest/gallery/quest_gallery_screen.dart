import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
// import 'package:eco_reward_app/screens/quest/gallery/widget/quest_image.dart';

class QuestGalleryScreen extends StatelessWidget {
  const QuestGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [ColorUtils.subOrange, ColorUtils.primary]),
          ),
          child: SafeArea(
            child: Column(
              children: [
                IconButton(
                  onPressed: () => _navigateToBefore(context),
                  icon: const Icon(Icons.navigate_before,
                      color: ColorUtils.black, size: 50),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: GridView.builder(
                    padding: const EdgeInsets.all(10),
                    shrinkWrap: true,
                    itemCount: 20,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_navigateToBefore(context) async {
  Navigator.pop(context);
}

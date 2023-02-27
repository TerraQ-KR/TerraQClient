import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';

class QuestStatusScreen extends StatelessWidget {
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
        child: Positioned(
          bottom: 0,
          child: Center(
            child: Container(
              width: 360,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/quest_icon_box.dart';

class QuestInformBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Column(
            children: [
              QuestIconBox(
                icon: Icons.date_range,
                text: 'Date',
              ),
              QuestIconBox(
                icon: Icons.camera,
                text: 'Authentication methods',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
          child: Column(
            children: [
              Row(
                children: [
                  const QuestIconBox(
                    icon: Icons.watch,
                    text: 'Date',
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.navigate_next, size: 30),
                  ),
                ],
              ),
              Row(
                children: [
                  const QuestIconBox(
                    icon: Icons.camera,
                    text: 'Authentication methods',
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.navigate_next, size: 30),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

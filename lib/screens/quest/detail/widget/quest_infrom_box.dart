import 'package:flutter/material.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/quest_icon_box.dart';

class QuestInformBox extends StatelessWidget {
  final String startDate;
  final String endDate;

  const QuestInformBox(
      {super.key, required this.startDate, required this.endDate});
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
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    QuestIconBox(
                      icon: Icons.watch,
                      text: 'Date :  $startDate ~ $endDate',
                    ),
                    IconButton(
                      // ignore: no-empty-block
                      onPressed: () {},
                      icon: const Icon(Icons.navigate_next, size: 30),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const QuestIconBox(
                      icon: Icons.camera,
                      text: 'Authentication methods',
                    ),
                    IconButton(
                      // ignore: no-empty-block
                      onPressed: () {},
                      icon: const Icon(Icons.navigate_next, size: 30),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

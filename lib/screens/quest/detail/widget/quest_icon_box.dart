import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/utils/font_utils.dart';

class QuestIconBox extends StatelessWidget {
  final IconData icon;
  final String text;
  const QuestIconBox({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(icon),
          ),
          Text(
            text,
            style: const TextStyle(
              color: ColorUtils.black,
              fontSize: 18,
              fontFamily: FontUtils.primary,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.navigate_next, size: 30),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/screens/quest/detail/style/detail_theme.dart';

class QuestIconBox extends StatelessWidget {
  final IconData icon;
  final String text;
  const QuestIconBox({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Wrap(
        children: [
          Row(
            children: [
              Icon(icon),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  text,
                  style: detailTheme.textTheme.bodyMedium!
                      .copyWith(color: ColorUtils.black),
                  softWrap: true,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

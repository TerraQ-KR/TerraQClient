import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';

class QuestIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const QuestIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FloatingActionButton.small(
          backgroundColor: ColorUtils.white,
          onPressed: onPressed,
          child: Icon(icon, color: ColorUtils.black, size: 20),
        ),
      ],
    );
  }
}

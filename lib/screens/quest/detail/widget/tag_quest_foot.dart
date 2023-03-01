import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';

class TagQuestFoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorUtils.subBlue,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.assist_walker, size: 20),
          Text(
            "500Km",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorUtils.white,
              fontSize: 14,
              fontFamily: "Nunito",
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

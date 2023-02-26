import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';

class BoxPeople extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorUtils.grey04,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person),
          Text(
            "999+",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorUtils.black,
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

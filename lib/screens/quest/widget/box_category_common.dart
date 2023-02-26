import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';

class BoxCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorUtils.subBlue,
      ),
      child: const Text(
        "Reuse",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: "Nunito",
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

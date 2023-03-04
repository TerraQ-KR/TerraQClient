// ignore_for_file: camel_case_types

import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/utils/font_utils.dart';
import 'package:flutter/material.dart';

class personalProfile extends StatelessWidget {
  final String name = "Nickname";
  final String personalStyle = "Passionate activist";

  const personalProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: const BoxDecoration(
              color: ColorUtils.white,
              shape: BoxShape.circle,
              border: Border(),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(personalStyle,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: FontUtils.primary,
                  )),
              const SizedBox(height: 5),
              Text(name,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    fontFamily: FontUtils.bold,
                  )),
            ],
          )
        ],
      ),
    );
  }
}

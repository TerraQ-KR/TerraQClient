import 'dart:async';

import 'package:eco_reward_app/routes.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    double pixelWidth = MediaQuery.of(context).size.width;
    Timer(
      const Duration(milliseconds: 1500),
      () => Navigator.pushNamed(
        context,
        Routes.login,
      ),
    );

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.circle_outlined,
              size: pixelWidth * 0.7,
            ),
            const Text(
              "TerraQ",
              style: TextStyle(color: ColorUtils.black, fontSize: 45),
            )
          ],
        ),
      ),
    );
  }
}

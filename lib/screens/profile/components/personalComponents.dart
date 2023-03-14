// ignore: prefer-single-widget-per-file
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/utils/font_utils.dart';
import 'package:flutter/material.dart';

class PersonalComponent extends StatelessWidget {
  final String navigatePath;
  final String componentText;
  final IconData componentIcon;
  final double angle;

  const PersonalComponent({
    super.key,
    required this.navigatePath,
    required this.componentText,
    required this.componentIcon,
    this.angle = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    double pixelWidth = deviceSize.width;
    double pixelHeight = deviceSize.height;

    return InkWell(
      // ignore: prefer-extracting-callbacks
      onTap: () {
        Navigator.pushNamed(context, navigatePath);
      },
      child: Container(
          padding:
              EdgeInsets.fromLTRB(0.06 * pixelWidth, 0, 0.06 * pixelWidth, 0),
          decoration: const BoxDecoration(color: ColorUtils.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Transform.rotate(
                    angle: angle,
                    child: Icon(
                      componentIcon,
                      size: 0.04 * pixelHeight,
                    ),
                  ),
                  SizedBox(
                    width: 0.04 * pixelWidth,
                  ),
                  Text(
                    componentText,
                    style: TextStyle(
                      fontSize: 0.025 * pixelHeight,
                      fontWeight: FontWeight.w900,
                      fontFamily: FontUtils.primary,
                    ),
                  )
                ],
              ),
              Icon(Icons.arrow_forward_ios_rounded,
                  size: 0.03 * pixelHeight, color: ColorUtils.grey05)
            ],
          )),
    );
  }
}

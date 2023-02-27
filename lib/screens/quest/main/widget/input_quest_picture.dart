import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/screens/quest/main/widget/box_category_common.dart';
import 'package:eco_reward_app/screens/quest/main/widget/box_people_common.dart';

class InputQuestPicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      height: 100,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 360,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorUtils.white,
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 10,
                  top: 10,
                  child: BoxCategory(),
                ),
                Positioned(
                  left: 90,
                  top: 10,
                  child: BoxPeople(),
                ),
                const Positioned(
                  left: 20,
                  top: 40,
                  child: SizedBox(
                    width: 250,
                    height: 45,
                    child: Text(
                      "Quest name ~~",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 20,
                  top: 69,
                  child: SizedBox(
                    width: 250,
                    height: 21,
                    child: Text(
                      'Quest description ~~',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  right: 40,
                  top: 10,
                  child: SizedBox(
                    width: 50,
                    child: Icon(Icons.square, size: 80),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

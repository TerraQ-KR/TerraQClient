import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/screens/quest/widget/button_quest_common.dart';
import 'package:eco_reward_app/screens/quest/widget/box_category_common.dart';
import 'package:eco_reward_app/screens/quest/widget/box_people_common.dart';

class InputQuest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 130,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 360,
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 165,
                  top: 90,
                  child: ButtonQuest(
                    onPressed: () => {},
                  ),
                ),
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
                  right: 10,
                  top: 10,
                  child: IconButton(
                    icon: Icon(Icons.navigate_next, size: 45),
                    onPressed: null,
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

import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/screens/quest/main/widget/tag_quest_common.dart';
import 'package:eco_reward_app/screens/quest/main/widget/tag_quest_people.dart';

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
                  top: 15,
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                ),
                const Positioned(
                  left: 90,
                  top: 10,
                  child: TagQuest(text: 'Reuse'),
                ),
                Positioned(
                  left: 170,
                  top: 10,
                  child: TagQuestPeople(),
                ),
                const Positioned(
                  left: 90,
                  top: 35,
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
                const Positioned(
                  left: 90,
                  bottom: 15,
                  child: SizedBox(
                    width: 250,
                    height: 20,
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
                Positioned(
                  right: 10,
                  top: 10,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark,
                        color: ColorUtils.subBlue, size: 30),
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

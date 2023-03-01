import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/quest_description_box.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/quest_infrom_box.dart';
import 'package:eco_reward_app/screens/quest/main/widget/tag_quest_people.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/tag_quest_foot.dart';

class QuestDetailScreen extends StatefulWidget {
  @override
  State<QuestDetailScreen> createState() => _QuestDetailScreen();
}

class _QuestDetailScreen extends State<QuestDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [ColorUtils.subOrange, ColorUtils.primary]),
          ),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                        onPressed: () => _navigateToBefore(context),
                        icon: const Icon(Icons.navigate_before,
                            color: ColorUtils.black, size: 50),
                      ),
                      const Icon(Icons.recycling,
                          color: ColorUtils.black, size: 30),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(top: 100),
                          child: Text(
                            'Quest name ~~',
                            style: TextStyle(
                              color: ColorUtils.black,
                              fontSize: 24,
                              fontFamily: "Nunito",
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.all(20),
                                child: TagQuestFoot()),
                            TagQuestPeople(),
                          ],
                        ),
                        QuestInformBox(),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: QuestDescriptionBox(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

_navigateToBefore(context) async {
  return Navigator.pop(context);
}

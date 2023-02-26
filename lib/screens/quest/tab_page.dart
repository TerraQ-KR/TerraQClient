import 'package:flutter/material.dart';

import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/screens/quest/quest_list_screen.dart';
import 'package:eco_reward_app/screens/quest/quest_myquest_screen.dart';

class TabPage extends StatelessWidget {
  const TabPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(AppBar().preferredSize.height),
            child: Container(
              height: 45,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.transparent,
                ),
                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorUtils.subBlue,
                  ),
                  tabs: const [
                    Tab(
                      child: Text(
                        'Quest',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'My Quest',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            QuestListScreen(),
            MyQuestScreen(),
          ],
        ),
      ),
    );
  }
}

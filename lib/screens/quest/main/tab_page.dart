import 'package:flutter/material.dart';

import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/screens/quest/main/quest_list_screen.dart';
import 'package:eco_reward_app/screens/quest/main/quest_myquest_screen.dart';

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
          backgroundColor: Colors.transparent,
          title: const Text('tab bar'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(AppBar().preferredSize.height),
            child: SizedBox(
              height: 45,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorUtils.white,
                ),
                child: TabBar(
                  labelColor: ColorUtils.white,
                  unselectedLabelColor: ColorUtils.black,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorUtils.subBlue,
                  ),
                  tabs: [
                    Tab(
                      child: Text(
                        'Quest',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Tab(
                      child: Text(
                        'My Quest',
                        style: Theme.of(context).textTheme.titleMedium,
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

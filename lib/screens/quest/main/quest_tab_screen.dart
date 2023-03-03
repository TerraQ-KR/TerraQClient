import 'package:flutter/material.dart';

import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/screens/quest/main/quest_list_screen.dart';
import 'package:eco_reward_app/screens/quest/main/quest_myquest_screen.dart';

class QuestTabScreen extends StatefulWidget {
  const QuestTabScreen({
    super.key,
  });

  @override
  State<QuestTabScreen> createState() => _QuestTabScreenState();
}

class _QuestTabScreenState extends State<QuestTabScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [ColorUtils.subOrange, ColorUtils.primary]),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
          body: Container(
            margin: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(bottom: 20),
                  child: IconButton(
                    onPressed: () => _navigateToBefore(context),
                    icon: const Icon(Icons.navigate_before,
                        color: ColorUtils.black, size: 50),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ColorUtils.white,
                    ),
                    child: TabBar(
                      tabs: [
                        Container(
                          height: 45,
                          alignment: Alignment.center,
                          child: Text(
                            'Quest',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        Container(
                          height: 45,
                          alignment: Alignment.center,
                          child: Text(
                            'My Quest',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ],
                      controller: _tabController,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ColorUtils.subBlue,
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      QuestListScreen(),
                      MyQuestScreen(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_navigateToBefore(context) async {
  return Navigator.pop(context);
}

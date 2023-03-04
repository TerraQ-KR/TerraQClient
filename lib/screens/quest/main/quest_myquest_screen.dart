import 'package:flutter/material.dart';
import 'package:eco_reward_app/screens/quest/main/widget/input_quest_common.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/toolbar_quest.dart';

class MyQuestScreen extends StatefulWidget {
  @override
  State<MyQuestScreen> createState() => _MyQuestScreenState();
}

class _MyQuestScreenState extends State<MyQuestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            ToolbarQuest(),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      InputQuest(
                        subCategoryName: 'Saving',
                        questName: '가전제품 플러그 뽑아두기',
                        memo: '사용하지 않는 가전제품이라도 플러그 ~',
                        challenger: 150,
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

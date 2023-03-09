import 'package:flutter/material.dart';
import 'package:eco_reward_app/screens/quest/main/widget/input_quest_common.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/toolbar_quest.dart';
import 'package:eco_reward_app/network/provider/api_path.dart';
import 'package:eco_reward_app/network/provider/query_keys.dart';
import 'package:eco_reward_app/network/custom_jobs.dart';
import 'package:eco_reward_app/screens/quest/main/models/get_myquest.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MyQuestScreen extends HookWidget {
  const MyQuestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quest = cachedQuery(
        queryKey: QueryKeys().myQuestIngList(1),
        path: ApiPaths().myQuestIngList(1));
    // ignore: prefer_if_null_operators
    final questData = getMyQuest(quest.data);

    final isSuccess = quest.isSuccess;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            ToolbarQuest(),
            Expanded(
              child: isSuccess
                  ? ListView.builder(
                      itemCount: questData.length,
                      itemBuilder: (BuildContext context, int index) {
                        final data = questData[index];
                        // ignore: newline-before-return
                        return Container(
                          margin: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              InputQuest(
                                quest: data,
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}

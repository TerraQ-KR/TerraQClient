import 'package:flutter/material.dart';
import 'package:eco_reward_app/routes.dart';
import 'package:eco_reward_app/screens/quest/main/widget/input_quest_common.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/toolbar_quest.dart';
import 'package:eco_reward_app/network/provider/api_paths.dart';
import 'package:eco_reward_app/network/provider/query_keys.dart';
import 'package:eco_reward_app/network/custom_jobs.dart';
import 'package:eco_reward_app/screens/quest/main/models/get_myquest.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MyQuestScreen extends HookWidget {
  const MyQuestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mid = Arguments(QueryParams(context)).mid;

    var quest = cachedQuery(
        queryKey: QueryKeys.myQuestIngList(mid),
        path: ApiPaths.myQuestIngList(mid));
    // ignore: prefer_if_null_operators
    var questData = getMyQuest(quest.data);

    var doneQuest = cachedQuery(
        queryKey: QueryKeys.myQuestDoneList(mid),
        path: ApiPaths.myQuestDoneList(mid));
    var doneQuestData = getMyQuest(doneQuest.data);

    final isSuccess = quest.isSuccess;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const ToolbarQuest(),
            Expanded(
              child: isSuccess
                  ? ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: questData.length + doneQuestData.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index < questData.length) {
                          return InputQuest(quest: questData[index]);
                        } else {
                          final doneIndex = index - questData.length;
                          return InputQuest(quest: doneQuestData[doneIndex]);
                        }
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

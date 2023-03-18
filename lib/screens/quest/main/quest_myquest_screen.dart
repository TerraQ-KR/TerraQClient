import 'package:flutter/material.dart';
import 'package:eco_reward_app/screens/quest/main/widget/input_quest_common.dart';
import 'package:eco_reward_app/screens/quest/main/widget/input_quest_done.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/toolbar_quest.dart';
import 'package:eco_reward_app/network/provider/api_path.dart';
import 'package:eco_reward_app/network/provider/query_keys.dart';
import 'package:eco_reward_app/network/custom_jobs.dart';
import 'package:eco_reward_app/screens/quest/main/models/get_myquest.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MyQuestScreen extends StatefulHookWidget {
  const MyQuestScreen({super.key});

  @override
  State<MyQuestScreen> createState() => _MyQuestScreenState();
}

enum SortedOrder { Date, Category }

class _MyQuestScreenState extends State<MyQuestScreen> {
  SortedOrder order = SortedOrder.Category;

  @override
  Widget build(BuildContext context) {
    // var mid = Arguments(QueryParams(context)).mid;

    final quest = cachedQuery(
        queryKey: QueryKeys().myQuestIngList(1),
        path: ApiPaths().myQuestIngList(1));
    // ignore: prefer_if_null_operators
    final questData = getMyQuest(quest.data);

    final doneQuest = cachedQuery(
        queryKey: QueryKeys().myQuestDoneList(1),
        path: ApiPaths().myQuestDoneList(1));
    final doneQuestData = getMyQuest(doneQuest.data);

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
                  ? ListView.separated(
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10),
                      itemCount: questData.length + doneQuestData.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index < questData.length) {
                          return InputQuest(quest: questData[index]);
                        } else {
                          final doneIndex = index - questData.length;
                          return InputQuestDone(
                              quest: doneQuestData[doneIndex]);
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

import 'package:flutter/material.dart';
import 'package:eco_reward_app/routes.dart';
import 'package:eco_reward_app/screens/quest/main/widget/input_quest_picture.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/toolbar_quest.dart';
import 'package:eco_reward_app/network/provider/api_paths.dart';
import 'package:eco_reward_app/network/provider/query_keys.dart';
import 'package:eco_reward_app/network/custom_jobs.dart';
import 'package:eco_reward_app/screens/quest/main/models/get_quest.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class QuestListScreen extends HookWidget {
  const QuestListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mid = Arguments(QueryParams(context)).mid;

    var quest = cachedQuery(
        queryKey: QueryKeys().questNotMyQuestList(mid),
        path: ApiPaths.questNotMyQuestList(mid));

    var questData = getQuestNotMyQuestList(quest.data);

    final isSuccess = quest.isSuccess;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          const SizedBox(height: 20),
          const ToolbarQuest(),
          Expanded(
            child: isSuccess && questData.isNotEmpty
                ? ListView.builder(
                    itemCount: questData.length,
                    itemBuilder: (BuildContext context, int index) {
                      final data = questData[index];
                      // ignore: newline-before-return
                      return Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            InputQuestPicture(
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
    );
  }
}

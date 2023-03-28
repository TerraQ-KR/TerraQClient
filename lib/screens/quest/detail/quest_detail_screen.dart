import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/network/provider/api_path.dart';
import 'package:eco_reward_app/network/provider/query_keys.dart';
import 'package:eco_reward_app/network/custom_jobs.dart';
import 'package:eco_reward_app/screens/quest/detail/model/get_detail.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/container_quest_detail.dart';

class QuestDetailScreen extends HookWidget {
  final int qid;
  const QuestDetailScreen({Key? key, required this.qid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quest = cachedQuery(
        queryKey: QueryKeys.myQuestDetailView(qid),
        path: ApiPaths().myQuestDetailView(qid));

    getDetail questData = getdetail(quest.data);
    final isSuccess = quest.isSuccess;
    // ignore: newline-before-return
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
                  padding: const EdgeInsets.all(20),
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
                  child: isSuccess
                      ? ContainerQuestDetail(
                          questName: questData.questName,
                          startDate: questData.startDate,
                          endDate: questData.dueDate,
                          information: questData.briefing,
                          reward: questData.reward.toInt(),
                          challenger: questData.challenger,
                        )
                      : const SizedBox(),
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

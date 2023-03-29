import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/routes.dart';
import 'package:eco_reward_app/network/provider/api_path.dart';
import 'package:eco_reward_app/network/provider/query_keys.dart';
import 'package:eco_reward_app/network/custom_jobs.dart';
import 'package:eco_reward_app/screens/quest/detail/model/get_detail.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/container_quest_detail_done.dart';

class QuestDetailDoneScreen extends HookWidget {
  QuestDetailDoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var memdoid = memDoIdArguments(QueryParams(context)).memdoid;

    final quest = cachedQuery(
        queryKey: QueryKeys().myQuestDetailView(memdoid),
        path: ApiPaths().myQuestDetailView(memdoid));

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
                      Hero(
                        tag: 'quest detail done back $memdoid',
                        child: IconButton(
                          onPressed: () => _navigateToBefore(context),
                          icon: const Icon(Icons.navigate_before,
                              color: ColorUtils.black, size: 50),
                        ),
                      ),
                      const Icon(Icons.recycling,
                          color: ColorUtils.black, size: 30),
                    ],
                  ),
                ),
                Expanded(
                  child: isSuccess
                      ? ContainerQuestDetailDone(
                          memDoId: questData.memDoId,
                          id: questData.questId,
                          questName: questData.questName,
                          startDate: questData.startDate,
                          endDate: questData.dueDate,
                          reward: questData.reward,
                          challenger: questData.challenger,
                          images: questData.images,
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

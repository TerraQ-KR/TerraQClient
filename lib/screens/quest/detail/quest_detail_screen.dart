import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/network/provider/api_path.dart';
import 'package:eco_reward_app/network/provider/query_keys.dart';
import 'package:eco_reward_app/network/custom_jobs.dart';
import 'package:eco_reward_app/screens/quest/main/models/get_myquest.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/container_quest_detail.dart';

class QuestDetailScreen extends HookWidget {
  final int memDoId;
  QuestDetailScreen({required this.memDoId, super.key});

  @override
  Widget build(BuildContext context) {
    // Arguments args = ModalRoute.of(context)!.settings.arguments as Arguments;
    // print(args.memDoId);
    // final int detail = memDoId as int;
    final quest = cachedQuery(
        queryKey: QueryKeys().myQuestDetailView(memDoId),
        path: ApiPaths().myQuestDetailView(memDoId));
    final questData = getMyQuest(quest.data);
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
                          quest: questData.first,
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

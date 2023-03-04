import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/container_quest_detail.dart';

class QuestDetailScreen extends StatefulWidget {
  const QuestDetailScreen({super.key});

  @override
  State<QuestDetailScreen> createState() => _QuestDetailScreen();
}

class _QuestDetailScreen extends State<QuestDetailScreen> {
  @override
  Widget build(BuildContext context) {
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
                  child: ContainerQuestDetail(
                    questName: "가전제품 플러그 뽑아두기",
                    briefing:
                        "사용하지 않는 가전제품이라도 플러그가 꽂혀있으면 “대기전력”이 소모됩니다! 당장 사용하지 않는 제품들의 플러그를 뽑아 돈도 아끼고, 환경도 보호해주세요.",
                    information: "메모메모 ~~~ 많이 추가해주세요 길이제한 500 ~~",
                  ),
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

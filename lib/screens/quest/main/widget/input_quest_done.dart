import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/routes.dart';
import 'package:eco_reward_app/screens/quest/main/style/main_theme.dart';
import 'package:eco_reward_app/screens/quest/main/widget/button_quest_common.dart';
import 'package:eco_reward_app/screens/quest/main/widget/tag_quest_common.dart';
import 'package:eco_reward_app/screens/quest/main/widget/tag_quest_people.dart';
import 'package:eco_reward_app/screens/quest/main/models/t_my_quest.dart';
import 'package:eco_reward_app/screens/quest/detail/quest_detail_done_screen.dart';

class InputQuestDone extends HookWidget {
  final TMyQuest quest;

  const InputQuestDone({
    Key? key,
    required this.quest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 150,
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorUtils.white,
              ),
              child: Stack(
                children: [
                  Container(
                    alignment: const Alignment(0.8, 0.8),
                    child: ButtonQuest(),
                  ),
                  Container(
                    alignment: const Alignment(-0.8, -0.8),
                    child: TagQuest(text: quest.subCategoryName ?? 'Recycle'),
                  ),
                  Container(
                    alignment: const Alignment(-0.2, -0.8),
                    child: TagQuestPeople(quest_user_count: 100),
                  ),
                  Container(
                    alignment: const Alignment(-0.6, -0.3),
                    child: Text(
                      quest.questName!,
                      style: questTheme.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    alignment: const Alignment(-0.6, 0.1),
                    child: Text(
                      quest.briefing!,
                      style: questTheme.textTheme.bodyLarge,
                    ),
                  ),
                  Container(
                    alignment: const Alignment(0.9, -0.8),
                    child: IconButton(
                      onPressed: () =>
                          _navigateToQuestDetailScreen(context, quest.memDoId!),
                      icon: const Icon(Icons.navigate_next, size: 45),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_navigateToQuestDetailScreen(context, id) async {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => QuestDetailDoneScreen(id)),
  );
}

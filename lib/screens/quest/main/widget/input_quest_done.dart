import 'package:flutter/material.dart';
import 'package:eco_reward_app/routes.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:badges/badges.dart' as badges;
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/screens/quest/main/style/main_theme.dart';
import 'package:eco_reward_app/screens/quest/main/widget/button_quest_common.dart';
import 'package:eco_reward_app/screens/quest/main/widget/tag_quest_common.dart';
import 'package:eco_reward_app/screens/quest/main/widget/tag_quest_people.dart';
import 'package:eco_reward_app/screens/quest/main/models/t_my_quest.dart';

class InputQuestDone extends StatefulHookWidget {
  final TMyQuest quest;

  const InputQuestDone({
    Key? key,
    required this.quest,
  }) : super(key: key);

  @override
  State<InputQuestDone> createState() => _InputQuestDoneState();
}

class _InputQuestDoneState extends State<InputQuestDone> {
  bool isTextOverflow = false;
  bool isMore = false;

  var maxLength = 5;

  @override
  void initState() {
    super.initState();

    isTextOverflow = widget.quest.briefing!.length > maxLength;
    isMore = !isTextOverflow;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FractionallySizedBox(
        widthFactor: 0.85,
        child: Wrap(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorUtils.white,
              ),
              child: Wrap(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 20, top: 5),
                                child: TagQuest(
                                    text: widget.quest.subCategoryName!),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10, top: 5),
                                child: TagQuestPeople(
                                    quest_user_count: widget.quest.challenger!),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 10, top: 5),
                            child: IconButton(
                              onPressed: () => _navigateToQuestDetailScreen(
                                  context, widget.quest.memDoId!),
                              icon: const Icon(Icons.navigate_next, size: 45),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            child: Text(
                              widget.quest.questName!,
                              style: questTheme.textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          isTextOverflow && !isMore
                              ? Container(
                                  margin: const EdgeInsets.only(right: 20),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isMore = !isMore;
                                      });
                                    },
                                    child: badges.Badge(
                                      badgeContent: Icon(
                                        Icons.arrow_drop_down,
                                        color: ColorUtils.black,
                                        size: 30,
                                      ),
                                      badgeStyle: badges.BadgeStyle(
                                        elevation: 0,
                                        badgeColor: Colors.transparent,
                                        shape: badges.BadgeShape.square,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 10, bottom: 10),
                        child: Text(
                          widget.quest.briefing!,
                          maxLines: isTextOverflow && !isMore ? 1 : 10,
                          overflow: isTextOverflow && !isMore
                              ? TextOverflow.ellipsis
                              : TextOverflow.visible,
                          style: questTheme.textTheme.bodyLarge,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.only(right: 20, bottom: 10),
                        child: ButtonQuest(
                          onPressed: () => _showDialog(context),
                        ),
                      ),
                    ],
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
  return Navigator.pushNamed(
    context,
    Routes.questdetail,
    arguments: id,
  );
}

void _showDialog(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("This quest is already certified.",
            style: questTheme.textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
            )),
        actions: [
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

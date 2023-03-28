import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:fl_query/fl_query.dart';
import 'package:fl_query_hooks/fl_query_hooks.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:eco_reward_app/routes.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/network/provider/api_paths.dart';
import 'package:eco_reward_app/network/provider/query_keys.dart';
import 'package:eco_reward_app/network/custom_jobs.dart';
import 'package:eco_reward_app/network/BasicAPI.dart';
import 'package:eco_reward_app/screens/quest/main/style/main_theme.dart';
import 'package:eco_reward_app/screens/quest/main/widget/tag_quest_common.dart';
import 'package:eco_reward_app/screens/quest/main/widget/tag_quest_people.dart';
import 'package:eco_reward_app/screens/quest/main/models/t_quest.dart';

class InputQuestPicture extends StatefulHookWidget {
  final TQuest quest;

  const InputQuestPicture({
    Key? key,
    required this.quest,
  }) : super(key: key);

  @override
  State<InputQuestPicture> createState() => _InputQuestPictureState();
}

class _InputQuestPictureState extends State<InputQuestPicture> {
  late bool isBookmarked;
  bool isTextOverflow = false;
  bool isMore = false;

  var maxLength = 5;

  @override
  void initState() {
    super.initState();
    isBookmarked = false;
    isTextOverflow = widget.quest.briefing!.length > maxLength;
    isMore = !isTextOverflow;
  }

  void _toggleBookmark() async {
    setState(() {
      isBookmarked = !isBookmarked;
    });
    final mid = Arguments(QueryParams(context)).mid;
    final qid = widget.quest.questId ?? 1;
    final myquestQuery = cachedQuery(
      queryKey: QueryKeys().myQuestIngList(mid),
      path: ApiPaths.myQuestIngList(mid),
    );
    final questQuery = cachedQuery(
      queryKey: QueryKeys().questNotMyQuestList(mid),
      path: ApiPaths.questNotMyQuestList(mid),
    );

    final mutateQuest = cachedMutation(
        mutationKey: 'add-my-quest',
        apiType: 'POST',
        path: ApiPaths.addMyQuest(mid, qid));

    mutateQuest.mutate(
      qid,
      onData: (payload, variables, context) =>
          {myquestQuery.refetch(), questQuery.refetch()},
    );

    // final Response<dynamic> response = await API.POST(
    //     path: ApiPaths.addMyQuest(mid, qid), data: {'bookmark': isBookmarked});
  }
  // final mutateQuest = cachedMutation(
  //   mutationKey: 'addMyQuest',
  //   apiType: 'POST',
  //   path: ApiPaths.addMyQuest(mid, id),
  // );

  //   mutateQuest.mutate(
  //     id,
  //     onData: (payload, variables, context) => {
  //       questQuery.refetch(),
  //       myquestQuery.refetch(),
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FractionallySizedBox(
        widthFactor: 0.9,
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
                                    text: widget.quest.subCategroyName!),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10, top: 5),
                                child: TagQuestPeople(
                                    quest_user_count:
                                        widget.quest.nowChallenger!),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 10, top: 5),
                            child: IconButton(
                              // ignore: prefer-extracting-callbacks
                              onPressed: _toggleBookmark,
                              icon: Icon(
                                isBookmarked
                                    ? Icons
                                        .bookmark_rounded // Use bookmark_rounded when bookmarked
                                    : Icons.bookmark_border_rounded,
                                // Use bookmark_border_rounded when not bookmarked
                                color: ColorUtils.subBlue,
                                size: 30,
                              ),
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

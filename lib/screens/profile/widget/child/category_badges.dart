// ignore_for_file: prefer-single-widget-per-file, prefer-extracting-callbacks,avoid-nested-conditional-expressions

import 'package:eco_reward_app/network/custom_jobs.dart';
import 'package:eco_reward_app/network/provider/api_paths.dart';
import 'package:eco_reward_app/network/provider/query_keys.dart';
import 'package:eco_reward_app/routes.dart';
import 'package:eco_reward_app/screens/profile/model/badge_model.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final cate_colorList = {
  "House": [
    const Color.fromARGB(255, 255, 215, 215),
    const Color.fromARGB(255, 255, 183, 183),
    const Color.fromARGB(255, 255, 153, 153),
    const Color.fromARGB(255, 255, 123, 123),
  ],
  "Consumption": [
    const Color.fromARGB(255, 173, 216, 173),
    const Color.fromARGB(255, 153, 216, 153),
    const Color.fromARGB(255, 133, 216, 133),
    const Color.fromARGB(255, 113, 216, 113),
  ],
  "Transport": [
    const Color.fromARGB(255, 255, 243, 200),
    const Color.fromARGB(255, 254, 232, 156),
    const Color.fromARGB(255, 253, 222, 112),
    const Color.fromARGB(255, 252, 212, 68),
  ],
  "Food": [
    const Color.fromARGB(255, 202, 231, 255),
    const Color.fromARGB(255, 164, 213, 255),
    const Color.fromARGB(255, 126, 196, 254),
    const Color.fromARGB(255, 88, 179, 253),
  ]
};

class CategoryBadges extends HookWidget {
  late Color color;
  late String category;
  late List<String> badges;
  late bool editmode;
  late bool needcreate;

  CategoryBadges({
    super.key,
    required this.category,
    required this.color,
    required this.badges,
    required this.editmode,
    required this.needcreate,
  });

  @override
  Widget build(BuildContext context) {
    var mid = Arguments(QueryParams(context)).mid;

    var badgesQuery = cachedQuery(
      queryKey: QueryKeys.myBadge(mid),
      path: ApiPaths.myBadge(mid),
    );

    final List<BadgeModel?> badgeLists = badgeList(badgesQuery.data);

    var matchedBadgesNames = [];
    var matchedBadges = [];
    var badgeimages = [];
    if (!badgesQuery.isError && !badgesQuery.isLoading) {
      // ignore: unused_local_variable
      var gotBadges = [false, false, false, false];

      for (var index = 0; index < badgeLists.length; index++) {
        if (badgeLists[index]!.badge.category.name == category) {
          matchedBadgesNames.add(badgeLists[index]!.badge.badgeName);
          matchedBadges.add(badgeLists[index]!.mgId);
          badgeimages.add(badgeLists[index]!.badge.category.icon);
          gotBadges[index] = true;
        }
      }

      return Container(
          decoration: BoxDecoration(color: color),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: ColorUtils.white,
            ),
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    Expanded(
                      child: BadgeComponent(
                        // ignore: prefer-first
                        index: 0,
                        badge: badges[0],
                        achived: gotBadges[0],
                        membergetId: gotBadges[0]
                            ? matchedBadges[
                                matchedBadgesNames.indexOf(badges[0])]
                            : -1,
                        // ignore: prefer-first
                        imageUrl: gotBadges[0]
                            ? badgeimages[matchedBadgesNames.indexOf(badges[0])]
                            : category,
                        editMode: editmode,
                        needCreate: needcreate,
                        iconColor: cate_colorList[category]![0],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: BadgeComponent(
                        badge: badges[2],
                        index: 2,
                        achived: gotBadges[2],
                        membergetId: gotBadges[2]
                            ? matchedBadges[
                                matchedBadgesNames.indexOf(badges[2])]
                            : -1,
                        imageUrl: gotBadges[2]
                            ? badgeimages[matchedBadgesNames.indexOf(badges[2])]
                            : category,
                        editMode: editmode,
                        needCreate: needcreate,
                        iconColor: cate_colorList[category]![2],
                      ),
                    ),
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    Expanded(
                      child: BadgeComponent(
                        badge: badges[1],
                        achived: gotBadges[1],
                        index: 1,
                        membergetId: gotBadges[1]
                            ? matchedBadges[
                                matchedBadgesNames.indexOf(badges[1])]
                            : -1,
                        imageUrl: gotBadges[1]
                            ? badgeimages[matchedBadgesNames.indexOf(badges[1])]
                            : category,
                        editMode: editmode,
                        iconColor: cate_colorList[category]![1],
                        needCreate: needcreate,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: BadgeComponent(
                        index: 3,
                        badge: badges[3],
                        achived: gotBadges[3],
                        membergetId: gotBadges[3]
                            ? matchedBadges[
                                matchedBadgesNames.indexOf(badges[3])]
                            : -1,
                        imageUrl: gotBadges[3]
                            ? badgeimages[matchedBadgesNames.indexOf(badges[3])]
                            : category,
                        editMode: editmode,
                        needCreate: needcreate,
                        iconColor: cate_colorList[category]![3],
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ));
    }

    return Container(
        decoration: BoxDecoration(color: color),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: ColorUtils.white,
          ),
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(15),
          child: null,
        ));
  }
}

class BadgeComponent extends HookWidget {
  int membergetId = -1;
  late int index;
  late String badgeName;
  late bool achived;
  late bool editMode;
  late bool needCreate;
  late String imageUrl;
  late Color iconColor;

  BadgeComponent({
    super.key,
    required this.membergetId,
    required String badge,
    required this.achived,
    required this.editMode,
    required this.needCreate,
    required this.imageUrl,
    required this.iconColor,
    required this.index,
  }) {
    List<String> temp = badge.split(" ");
    badgeName = temp.length == 1
        ? temp.join(" ")
        : [temp.sublist(0, temp.length - 1).join(" "), temp.last].join('\n');
    if (badgeName == "Eco-Transporter") {
      badgeName = badge.split("-").join("\n");
    }
  }

  @override
  Widget build(BuildContext context) {
    var mid = Arguments(QueryParams(context)).mid;

    final badgeUpdateMutation = cachedMutation(
      mutationKey: "patchBadge",
      apiType: "patch",
      path: ApiPaths.updateMainBadge(mid),
    );

    final badgeCreateMutation = cachedMutation(
      mutationKey: "createBadge",
      apiType: "POST",
      path: ApiPaths.createMainBadge,
    );

    final badgesQuery = cachedQuery(
      queryKey: QueryKeys.myBadge(mid),
      path: ApiPaths.myBadge(mid),
    );

    final percent = ["30", "50", "70", "100"];

    return Column(
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: const Border.fromBorderSide(
                    BorderSide(color: ColorUtils.grey03, width: 3),
                  ),
                  color: achived ? Colors.transparent : ColorUtils.grey03,
                  shape: BoxShape.circle,
                ),
                child: editMode && achived
                    ? InkWell(
                        onTap: () async {
                          needCreate
                              ? badgeCreateMutation.mutate(
                                  membergetId,
                                  onData: (payload, variables, context) =>
                                      {badgesQuery.refetch()},
                                )
                              : badgeUpdateMutation.mutate(
                                  membergetId,
                                  onData: (payload, variables, context) =>
                                      {badgesQuery.refetch()},
                                );
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image(
                              image: NetworkImage(imageUrl),
                              color: iconColor,
                            ),
                            Icon(
                              Icons.check_circle,
                              color: ColorUtils.grey07.withOpacity(0.8),
                              size: 60,
                            ),
                          ],
                        ),
                      )
                    : achived
                        ? Image(
                            image: NetworkImage(imageUrl),
                            color: iconColor,
                          )
                        : null,
              ),
              !achived
                  ? Text("${percent[index]}%",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: ColorUtils.grey05,
                      ))
                  : const Text(""),
            ],
          ),
        ),
        Text(badgeName,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: achived ? ColorUtils.black : ColorUtils.grey05,
            )),
      ],
    );
  }
}

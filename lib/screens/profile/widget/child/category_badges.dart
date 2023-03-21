// ignore_for_file: prefer-single-widget-per-file

import 'package:eco_reward_app/network/custom_jobs.dart';
import 'package:eco_reward_app/network/provider/api_paths.dart';
import 'package:eco_reward_app/network/provider/query_keys.dart';
import 'package:eco_reward_app/routes.dart';
import 'package:eco_reward_app/screens/profile/model/badge_model.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CategoryBadges extends HookWidget {
  late Color color;
  late String category;
  late List<String> badges;

  CategoryBadges({
    super.key,
    required this.category,
    required this.color,
    required this.badges,
  });

  @override
  Widget build(BuildContext context) {
    var mid = Arguments(QueryParams(context)).mid;

    var badgesQuery = cachedQuery(
      queryKey: QueryKeys.myBadge(mid),
      path: ApiPaths.myBadge(mid),
    );

    final List<BadgeModel?> badgeLists = badgeList(badgesQuery.data);

    var matchedBadges = [];
    if (!badgesQuery.isError && !badgesQuery.isLoading) {
      // ignore: unused_local_variable
      for (var index = 0; index < badgeLists.length; index++) {
        if (badgeLists[index]!.badge.category.name == category) {
          matchedBadges.add(badgeLists[index]!.badge.badgeName);
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
                        badge: badges[0],
                        achived: matchedBadges.contains(badges[0]),
                        imageUrl: category,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: BadgeComponent(
                        badge: badges[2],
                        achived: matchedBadges.contains(badges[2]),
                        imageUrl: category,
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
                        achived: matchedBadges.contains(badges[1]),
                        imageUrl: category,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: BadgeComponent(
                        badge: badges[3],
                        achived: matchedBadges.contains(badges[3]),
                        imageUrl: category,
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
          child: Row(
            children: [
              Expanded(
                  child: Column(
                children: [
                  Expanded(
                    child: BadgeComponent(
                      // ignore: prefer-first
                      badge: badges[0],
                      achived: false,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: BadgeComponent(badge: badges[1], achived: false),
                  ),
                ],
              )),
              Expanded(
                  child: Column(
                children: [
                  Expanded(
                    child: BadgeComponent(badge: badges[2], achived: false),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: BadgeComponent(badge: badges[3], achived: false),
                  ),
                ],
              ))
            ],
          ),
        ));
  }
}

class BadgeComponent extends StatelessWidget {
  late String badgeName;
  late bool achived;

  BadgeComponent({
    super.key,
    required String badge,
    required this.achived,
    String? imageUrl,
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
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorUtils.grey05.withOpacity(0.5),
            ),
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

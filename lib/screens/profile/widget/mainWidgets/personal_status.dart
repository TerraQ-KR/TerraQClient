// ignore_for_file: camel_case_types
import 'dart:math';

import 'package:eco_reward_app/network/custom_jobs.dart';
import 'package:eco_reward_app/network/provider/api_paths.dart';
import 'package:eco_reward_app/network/provider/query_keys.dart';
import 'package:eco_reward_app/routes.dart';
import 'package:eco_reward_app/screens/profile/constants/profile_icons.dart';
import 'package:eco_reward_app/screens/profile/model/member_profile.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/utils/font_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class personalStatus extends HookWidget {
  const personalStatus({super.key});

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    double pixelWidth = deviceSize.width;

    var mid = Arguments(QueryParams(context)).mid;

    var profileQuery = cachedQuery(
      queryKey: QueryKeys.memberdetail(mid),
      path: ApiPaths.memberdetail(mid),
    );

    MemberProfile profile = memberProfile(profileQuery.data);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Flexible(
          flex: 1,
          child: Row(
            children: [
              Transform.rotate(
                angle: -1.5707963267948966192313216916398,
                child: Icon(
                  ProfileIcons.carbonprint,
                  size: min(0.05 * pixelWidth, 20),
                  color: ColorUtils.white,
                ),
              ),
              SizedBox(width: 0.03 * pixelWidth),
              Text(
                "Quest Status",
                style: TextStyle(
                  color: ColorUtils.white,
                  fontSize: min(0.05 * pixelWidth, 25),
                  fontWeight: FontWeight.w600,
                  fontFamily: FontUtils.primary,
                ),
              ),
              SizedBox(width: 0.03 * pixelWidth),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Flexible(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                color: ColorUtils.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Status(amount: profile.progressQuests, state: "Progress"),
                  Status(amount: profile.successQuests, state: "Success"),
                  Status(amount: profile.badgeCount, state: "Badge"),
                ],
              ),
            ))
      ],
    );
  }
}

// ignore: prefer-single-widget-per-file
class Status extends StatelessWidget {
  final int amount;
  final String state;

  const Status({
    super.key,
    required this.amount,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    double pixelWidth = min(0.03 * deviceSize.height, 30);

    return Container(
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(amount.toString(),
              style: TextStyle(
                fontSize: pixelWidth,
                fontWeight: FontWeight.w700,
                fontFamily: FontUtils.bold,
              )),
          Text(state,
              style: TextStyle(
                fontSize: pixelWidth * 0.5,
                fontWeight: FontWeight.w500,
                fontFamily: FontUtils.bold,
              ))
        ],
      ),
    );
  }
}

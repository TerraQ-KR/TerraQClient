// ignore_for_file: camel_case_types

import 'dart:math';

import 'package:eco_reward_app/network/custom_jobs.dart';
import 'package:eco_reward_app/network/provider/api_paths.dart';
import 'package:eco_reward_app/network/provider/query_keys.dart';
import 'package:eco_reward_app/routes.dart';
import 'package:eco_reward_app/screens/profile/model/member_profile.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/utils/font_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class personalProfile extends HookWidget {
  final String personalTitle = "nickname";

  const personalProfile({
    super.key,
  });

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

    return Padding(
      padding: EdgeInsets.all(0.025 * pixelWidth),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(alignment: AlignmentDirectional.center, children: [
            Container(
              height: 0.255 * pixelWidth,
              width: 0.255 * pixelWidth,
              decoration: const BoxDecoration(
                color: ColorUtils.grey06,
                shape: BoxShape.circle,
                border: Border(),
              ),
            ),
            Container(
              height: 0.25 * pixelWidth,
              width: 0.25 * pixelWidth,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(profile.imageUrl)),
                color: ColorUtils.white,
                shape: BoxShape.circle,
                border: const Border(),
              ),
            ),
          ]),
          SizedBox(width: min(0.08 * pixelWidth, 25)),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(profile.title,
                    style: TextStyle(
                      fontSize: min(0.05 * pixelWidth, 15),
                      fontWeight: FontWeight.w700,
                      fontFamily: FontUtils.primary,
                    )),
                // SizedBox(height: max(0.02 * pixelWidth, 5)),
                Text(profile.nickname,
                    style: TextStyle(
                      fontSize: min(0.067 * pixelWidth, 32),
                      fontWeight: FontWeight.w700,
                      fontFamily: FontUtils.bold,
                    )),
              ])
        ],
      ),
    );
  }
}

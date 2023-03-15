// ignore_for_file: camel_case_types

import 'dart:math';

import 'package:eco_reward_app/network/custom_jobs.dart';
import 'package:eco_reward_app/network/provider/api_paths.dart';
import 'package:eco_reward_app/network/provider/query_keys.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
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

    var profileQuery = cachedQuery(
      queryKey: 'get-memeber-detail/1',
      path: ApiPaths.memberdetail(1),
    );

    return Padding(
      padding: EdgeInsets.all(0.025 * pixelWidth),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 0.25 * pixelWidth,
            width: 0.25 * pixelWidth,
            decoration: const BoxDecoration(
              color: ColorUtils.white,
              shape: BoxShape.circle,
              border: Border(),
            ),
          ),
          SizedBox(width: min(0.08 * pixelWidth, 25)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            // children: (profileQuery.hasData &&
            //         !profileQuery.isLoading &&
            //         !profileQuery.isError)
            //     ? [
            //         Text("title",
            //             style: TextStyle(
            //               fontSize: min(0.05 * pixelWidth, 15),
            //               fontWeight: FontWeight.w700,
            //               fontFamily: FontUtils.primary,
            //             )),
            //         // SizedBox(height: max(0.02 * pixelWidth, 5)),
            //         Text("",
            //             style: TextStyle(
            //               fontSize: min(0.067 * pixelWidth, 32),
            //               fontWeight: FontWeight.w700,
            //               fontFamily: FontUtils.bold,
            //             )),
            //       ]
            //     : [],
            // children: ,
          )
        ],
      ),
    );
  }
}

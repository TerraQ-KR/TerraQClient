import 'package:eco_reward_app/network/custom_jobs.dart';
import 'package:eco_reward_app/network/provider/api_paths.dart';
import 'package:eco_reward_app/network/provider/query_keys.dart';
import 'package:eco_reward_app/routes.dart';
import 'package:eco_reward_app/screens/profile/components/childAppbar.dart';
import 'package:eco_reward_app/screens/profile/components/imageSkeleton.dart';
import 'package:eco_reward_app/screens/profile/icons/profile_icons.dart';
import 'package:eco_reward_app/screens/profile/model/member_profile.dart';
import 'package:eco_reward_app/screens/profile/model/memberlist.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/utils/font_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LeaderBoard extends HookWidget {
  const LeaderBoard({super.key});

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    double pixelHeight = deviceSize.height;

    var mid = Arguments(QueryParams(context)).mid;

    var profileQuery = cachedQuery(
      queryKey: QueryKeys.memberdetail(mid),
      path: ApiPaths.memberdetail(mid),
    );

    MemberProfile profile = memberProfile(profileQuery.data);

    var membersQuery = cachedQuery(
      queryKey: QueryKeys.members,
      path: ApiPaths.members,
    );

    List<MemberProfile?> allMembers = memberList(membersQuery.data);

    int memberidx = 0;
    int idx = 0;
    if (allMembers != []) {
      for (var mem in allMembers) {
        if (mem!.memberid == profile.memberid) {
          memberidx = idx;
          break;
        }
        idx++;
      }
    }

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [ColorUtils.primary, ColorUtils.subBlue],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: ChildAppBar(context, "LeaderBoard"),
        body: Padding(
            padding: EdgeInsets.all(0.017 * pixelHeight),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: ColorUtils.white,
                        foregroundColor: ColorUtils.black,
                        padding: const EdgeInsets.all(18),
                      ),
                      child: const Icon(
                        ProfileIcons.sort_alt_up,
                        color: ColorUtils.black,
                        size: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.017 * pixelHeight),
                Container(
                  decoration: const BoxDecoration(
                    color: ColorUtils.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10)),
                  ),
                  child: LeaderBoardComponent(
                    isTop: true,
                    elem: profile,
                    index: idx + 1,
                  ),
                ),
                const Divider(
                  color: ColorUtils.grey10,
                  height: 0.1,
                ),
                Flexible(
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(10))),
                        child: ListView.separated(
                          itemCount: allMembers.length,
                          itemBuilder: (context, index) {
                            return LeaderBoardComponent(
                              isTop: false,
                              elem: allMembers[index],
                              index: index + 1,
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(
                            color: ColorUtils.grey05,
                            height: 0,
                          ),
                        )))
              ],
            )),
      ),
    );
  }
}

// ignore: prefer-single-widget-per-file
class LeaderBoardComponent extends StatelessWidget {
  late MemberProfile? elem;
  late int index;
  late bool isTop;

  LeaderBoardComponent({
    super.key,
    required this.isTop,
    required this.elem,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var mid = Arguments(QueryParams(context)).mid;

    return Container(
      decoration: const BoxDecoration(
        color: ColorUtils.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
      ),
      margin: const EdgeInsets.fromLTRB(10, 10, 40, 10),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageSkeleton(imageUrl: elem!.imageUrl, imageSize: 64),
              const SizedBox(width: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    elem!.nickname,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontFamily: FontUtils.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: ColorUtils.subOrange.withOpacity(0.6),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        width: 50,
                        height: 17,
                      ),
                      const SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                            color: ColorUtils.primary.withOpacity(0.6),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        width: 50,
                        height: 17,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          Text(index.toString(),
              style: TextStyle(
                color: isTop ? ColorUtils.black : ColorUtils.grey05,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: FontUtils.bold,
              )),
        ],
      ),
    );
  }
}

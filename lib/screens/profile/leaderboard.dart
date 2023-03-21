import 'package:eco_reward_app/network/custom_jobs.dart';
import 'package:eco_reward_app/network/provider/api_paths.dart';
import 'package:eco_reward_app/network/provider/query_keys.dart';
import 'package:eco_reward_app/routes.dart';
import 'package:eco_reward_app/screens/profile/components/childAppbar.dart';
import 'package:eco_reward_app/screens/profile/components/imageSkeleton.dart';
import 'package:eco_reward_app/screens/profile/constants/profile_icons.dart';
import 'package:eco_reward_app/screens/profile/model/member_profile.dart';
import 'package:eco_reward_app/screens/profile/model/memberlist.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/utils/font_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LeaderBoard extends StatefulHookWidget {
  const LeaderBoard({super.key});

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

enum SortedOrder { Reward, Success }

class _LeaderBoardState extends State<LeaderBoard> {
  SortedOrder order = SortedOrder.Reward;

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

    List<MemberProfile?> allMembers = [];

    switch (order) {
      case SortedOrder.Reward:
        allMembers = memberList(membersQuery.data);
        break;
      case SortedOrder.Success:
        allMembers = memberList(membersQuery.data);
        allMembers.sort((a, b) => b!.successQuests.compareTo(a!.successQuests));
        break;
      default:
        allMembers = memberList(membersQuery.data);
        break;
    }

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

    sortBottomModal() {
      return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
        ),
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    decoration: const BoxDecoration(
                      color: ColorUtils.grey05,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    height: 6,
                    width: 80,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: const Text(
                  "Please select the sort order",
                  style: TextStyle(
                      fontFamily: FontUtils.bold,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RadioListTile(
                title: const Text("Sorted by Reward",
                    style: TextStyle(
                        fontFamily: FontUtils.primary,
                        fontSize: 18,
                        fontWeight: FontWeight.w700)),
                value: SortedOrder.Reward,
                groupValue: order,
                onChanged: (SortedOrder? value) => setState(() {
                  order = value!;
                  Navigator.pop(context);
                }),
              ),
              const SizedBox(
                height: 10,
              ),
              RadioListTile(
                title: const Text("Sorted by Success",
                    style: TextStyle(
                        fontFamily: FontUtils.primary,
                        fontSize: 18,
                        fontWeight: FontWeight.w700)),
                value: SortedOrder.Success,
                groupValue: order,
                onChanged: (SortedOrder? value) => setState(() {
                  order = value!;
                  Navigator.pop(context);
                }),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          );
        },
      );
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
        appBar: ChildAppBar(
          context,
          "LeaderBoard",
        ),
        body: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        sortBottomModal();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: ColorUtils.white,
                        foregroundColor: ColorUtils.black,
                        padding: const EdgeInsets.all(10),
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
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: ColorUtils.subOrange,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          width: 70,
                          height: 17,
                          child: Text(
                              "${elem!.reward.toDouble().toString()} kg",
                              style: const TextStyle(
                                  color: ColorUtils.white, fontSize: 13))),
                      const SizedBox(width: 10),
                      Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: ColorUtils.primary,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          width: 70,
                          height: 17,
                          child: Text("# ${elem!.successQuests.toString()}",
                              style: const TextStyle(
                                  color: ColorUtils.white, fontSize: 13))),
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

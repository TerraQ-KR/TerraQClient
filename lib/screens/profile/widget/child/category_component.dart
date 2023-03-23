// ignore_for_file: prefer-single-widget-per-file

import 'package:eco_reward_app/network/custom_jobs.dart';
import 'package:eco_reward_app/network/provider/api_paths.dart';
import 'package:eco_reward_app/network/provider/query_keys.dart';
import 'package:eco_reward_app/routes.dart';
import 'package:eco_reward_app/screens/profile/model/badge_model.dart';
import 'package:eco_reward_app/screens/profile/widget/child/category_badges.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final colorList = [
  const Color.fromARGB(255, 255, 123, 123),
  const Color.fromARGB(255, 113, 216, 103),
  const Color.fromARGB(255, 252, 212, 68),
  const Color.fromARGB(255, 88, 179, 253)
];

final List<String> categoryes = ["House", "Transport", "Food", "Consumption"];

final Map<String, List<String>> cate_badges = {
  "House": [
    "Green Home Starter",
    "Green Home Explorer",
    "Green Home Leader",
    "Eco-Home Master"
  ],
  "Consumption": [
    "Eco-Conscious Consumer",
    "Green Shopper",
    "Sustainable Lifestyle Leader",
    "Eco-Consumption Master"
  ],
  "Transport": [
    "Green Commuter",
    "Eco-Transporter",
    "Green Mobility Champion",
    "Eco-Transport Master"
  ],
  "Food": [
    "Green Eater",
    "Green Eater",
    "Sustainable Food Leader",
    "Eco-Food Master"
  ],
};

class CategoryComponent extends StatefulHookWidget {
  const CategoryComponent({
    super.key,
  });

  @override
  State<CategoryComponent> createState() => _CategoryComponentState();
}

class _CategoryComponentState extends State<CategoryComponent>
    with TickerProviderStateMixin {
  final buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: ColorUtils.grey07,
    padding: const EdgeInsets.all(10),
  );
  late TabController _tabController;
  late bool setEditMode;
  bool hasMainBadge = false;

  int tab_index = 0;

  @override
  void initState() {
    _tabController = TabController(
      length: 4,
      vsync: this, //vsync에 this 형태로 전달해야 애니메이션이 정상 처리됨
    );
    _tabController.addListener(() {
      setState(() {
        tab_index = _tabController.index;
      });
    });
    setEditMode = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    double pixelHeight = deviceSize.height;
    double pixelWidth = deviceSize.width;

    var mid = Arguments(QueryParams(context)).mid;

    List<String> categorys = ["House", "Consumption", "Transport", "Food"];
    List<String> cateIcons = [
      "https://storage.googleapis.com/eco-reward-bucket/icon/holiday_village_white_36dp.png",
      "https://storage.googleapis.com/eco-reward-bucket/icon/shopping_basket_white_36dp.png",
      "https://storage.googleapis.com/eco-reward-bucket/icon/electric_moped_white_36dp.png",
      "https://storage.googleapis.com/eco-reward-bucket/icon/restaurant_menu_white_36dp.png",
    ];

    var badgesQuery = cachedQuery(
      queryKey: QueryKeys.myBadge(mid),
      path: ApiPaths.myBadge(mid),
    );
    if (!badgesQuery.isLoading && !badgesQuery.isError && badgesQuery.hasData) {
      final List<BadgeModel?> badgeLists = badgeList(badgesQuery.data);
      for (var badges in badgeLists) {
        if (badges!.choice) {
          hasMainBadge = true;
        }
      }
    }

    return Container(
      decoration: const BoxDecoration(color: ColorUtils.white),
      child: Container(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Stack(children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: ColorUtils.grey05,
                                blurRadius: 5.0,
                                spreadRadius: 0.0,
                                offset: Offset(0, 3))
                          ],
                          gradient: RadialGradient(
                            colors: [
                              Color.fromARGB(255, 252, 242, 181),
                              ColorUtils.white
                            ],
                            center: Alignment.topCenter,
                            radius: 1.0,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: !hasMainBadge
                          ? ElevatedButton(
                              onPressed: () => {
                                setState(
                                  () {
                                    setEditMode = !setEditMode;
                                  },
                                )
                              },
                              style: buttonStyle,
                              child: const Text("Set"),
                            )
                          : ElevatedButton(
                              onPressed: () => {
                                setState(
                                  () {
                                    setEditMode = !setEditMode;
                                  },
                                )
                              },
                              style: buttonStyle,
                              child: const Text("Edit"),
                            ),
                    )
                  ],
                ),
                Container(
                    decoration: const BoxDecoration(
                      color: ColorUtils.black,
                      shape: BoxShape.circle,
                    ),
                    margin: const EdgeInsets.all(30))
              ]),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: TabBar(
                isScrollable: false,
                tabs: [
                  for (var index in [0, 1, 2, 3])
                    Container(
                        margin: const EdgeInsets.all(5),
                        height: 30,
                        child: Image(
                          image: NetworkImage(cateIcons[index]),
                          color: tab_index == index
                              ? ColorUtils.white
                              : ColorUtils.grey04,
                        )),
                ],
                indicator: BoxDecoration(
                  color: colorList[tab_index],
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                ),
                indicatorColor: Colors.transparent,
                unselectedLabelColor: Colors.black,
                controller: _tabController,
              ),
            ),
            Expanded(
              flex: 7,
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  // ignore: prefer-first
                  for (var index in [0, 1, 2, 3])
                    CategoryBadges(
                      // ignore: prefer-first
                      category: categoryes[index],
                      color: colorList[index],
                      badges: cate_badges[categoryes[index]]!,
                      editmode: setEditMode,
                      needcreate: !hasMainBadge,
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

class MainBadge extends StatefulHookWidget {
  const MainBadge({super.key});

  @override
  State<MainBadge> createState() => _MainBadgeState();
}

class _MainBadgeState extends State<MainBadge> {
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

    return ElevatedButton(
        // ignore: prefer-extracting-callbacks
        onPressed: () async {
          badgeUpdateMutation.mutate(7, onData: ((payload, variables, context) {
            print("Success update");
          }));
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: ColorUtils.white,
          foregroundColor: ColorUtils.black,
          padding: const EdgeInsets.all(10),
        ),
        child: const Icon(Icons.camera_alt_rounded, size: 18));
  }
}

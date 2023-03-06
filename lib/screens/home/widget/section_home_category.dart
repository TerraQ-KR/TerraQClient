import 'package:eco_reward_app/network/const/api_home.dart';
import 'package:eco_reward_app/network/custom_jobs.dart';
import 'package:eco_reward_app/screens/home/models/get_category_list.dart';
import 'package:eco_reward_app/utils/list_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'box_home_category.dart';

class SectionHomeCategory extends HookWidget {
  const SectionHomeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCategoryQuery =
        cachedQuery(queryKey: "homeCategory", path: APIHome.homeCategoryAPI(1));

    final categoryList = getCategoryList(homeCategoryQuery.data);
    final isSuccess = homeCategoryQuery.isSuccess;

    return SizedBox(
      height: 400,
      child: isSuccess
          ? LayoutGrid(
              columnGap: 5,
              rowGap: 5,
              areas: '''
          A A B
          A A C
          D E E
        ''',
              columnSizes: [2.0.fr, 1.0.fr, 2.0.fr],
              rowSizes: [1.0.fr, 1.0.fr, 1.5.fr],
              children: [
                gridArea('A')
                    .containing(BoxHomeCategory(category: categoryList.first)),
                gridArea('B')
                    .containing(BoxHomeCategory(category: categoryList[1])),
                gridArea('C')
                    .containing(BoxHomeCategory(category: categoryList[2])),
                gridArea('D')
                    .containing(BoxHomeCategory(category: categoryList.first)),
                gridArea('E')
                    .containing(BoxHomeCategory(category: categoryList[3])),
              ],
            )
          : const SizedBox(),
    );
  }
}

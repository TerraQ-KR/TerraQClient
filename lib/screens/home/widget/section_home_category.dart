import 'package:eco_reward_app/screens/home/widget/box_home_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import '../constant/category_list.dart';

class SectionHomeCategory extends StatelessWidget {
  const SectionHomeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: LayoutGrid(
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
          gridArea('B').containing(BoxHomeCategory(category: categoryList[1])),
          gridArea('C').containing(BoxHomeCategory(category: categoryList[2])),
          gridArea('D')
              .containing(BoxHomeCategory(category: categoryList.first)),
          gridArea('E').containing(BoxHomeCategory(category: categoryList[3])),
        ],
      ),
    );
  }
}

import 'package:eco_reward_app/network/custom_jobs.dart';
import 'package:eco_reward_app/network/provider/api_paths.dart';
import 'package:eco_reward_app/network/provider/query_keys.dart';
import 'package:eco_reward_app/routes.dart';
import 'package:eco_reward_app/screens/profile/model/category_model.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/utils/font_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CategoryComponent extends HookWidget {
  const CategoryComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var mid = Arguments(QueryParams(context)).mid;

    var catergoryQuery = cachedQuery(
        queryKey: QueryKeys.getMemberCategory(mid),
        path: ApiPaths.getMemberCategory(1));

    List<CategoryModel?> categorys = categoryList(catergoryQuery.data);

    for (var e in categorys) {
      print(e!.name);
      print(e.icon);
    }

    return ListView.separated(
      itemBuilder: (context, index) {
        return Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(categorys[index]!.icon)),
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: const Border(),
              ),
              margin: const EdgeInsets.fromLTRB(20, 10, 30, 10),
            ),
            Text(categorys[index]!.name,
                style: const TextStyle(
                  color: ColorUtils.white,
                  fontSize: 28,
                  fontFamily: FontUtils.bold,
                )),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: categorys.length,
    );
  }
}

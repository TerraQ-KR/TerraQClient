import 'package:eco_reward_app/screens/profile/components/childAppbar.dart';
import 'package:eco_reward_app/screens/profile/widget/child/category_component.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MyBadges extends HookWidget {
  const MyBadges({super.key});

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    double pixelHeight = deviceSize.height;

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
        appBar: ChildAppBar(context, "Badges"),
        body: Padding(
          padding: EdgeInsets.all(0.017 * pixelHeight),
          child: const CategoryComponent(),
        ),
      ),
    );
  }
}

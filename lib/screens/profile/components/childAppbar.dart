import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
AppBar ChildAppBar(BuildContext context, String title) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.chevron_left_outlined,
          size: 40, color: ColorUtils.black),
      onPressed: () => {Navigator.pop(context)},
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(color: ColorUtils.black),
    ),
  );
}

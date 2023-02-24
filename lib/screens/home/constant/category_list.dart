import 'dart:ui';
import 'package:eco_reward_app/utils/color_utils.dart';
import '../class/t_category.dart';

final List<TCategory> categoryList = [
  TCategory(label: "HOUSE", value: "house", color: ColorUtils.subOrange),
  TCategory(
      label: "CONSUMP",
      value: "consump",
      color: const Color.fromARGB(255, 224, 131, 131)),
  TCategory(label: "TRANSPORT", value: "transport", color: ColorUtils.subBlue),
  TCategory(label: "FOOD", value: "food", color: ColorUtils.grey08),
];

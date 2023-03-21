import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/screens/quest/gallery/models/t_gallery.dart';
//개수만큼 채우기 아니면 그대로

class QuestImage extends StatelessWidget {
  final TGallery gallery;

  const QuestImage({
    Key? key,
    required this.gallery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DottedBorder(
        color: ColorUtils.grey07,
        strokeWidth: 1,
        radius: const Radius.circular(10),
        child: Image.network(gallery.image!),
      ),
    );
  }
}

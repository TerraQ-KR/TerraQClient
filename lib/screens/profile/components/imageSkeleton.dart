import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:flutter/material.dart';

class ImageSkeleton extends StatelessWidget {
  const ImageSkeleton({
    super.key,
    required this.imageUrl,
    required this.imageSize,
  });

  final String imageUrl;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.center, children: [
      Container(
        height: imageSize + 1,
        width: imageSize + 1,
        decoration: const BoxDecoration(
          color: ColorUtils.grey06,
          shape: BoxShape.circle,
          border: Border(),
        ),
      ),
      Container(
        height: imageSize,
        width: imageSize,
        decoration: BoxDecoration(
          image: imageUrl == ""
              ? null
              : DecorationImage(image: NetworkImage(imageUrl)),
          color: ColorUtils.white,
          shape: BoxShape.circle,
          border: const Border(),
        ),
      ),
    ]);
  }
}

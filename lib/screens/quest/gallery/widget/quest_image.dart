import 'package:flutter/material.dart';
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
      child: FittedBox(
        child: Image.network(gallery.image!),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/screens/quest/gallery/widget/quest_image.dart';
import 'package:eco_reward_app/network/provider/api_path.dart';
import 'package:eco_reward_app/network/provider/query_keys.dart';
import 'package:eco_reward_app/network/custom_jobs.dart';
import 'package:eco_reward_app/screens/quest/gallery/models/get_image.dart';

class QuestGalleryScreen extends HookWidget {
  const QuestGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final image = cachedQuery(
      queryKey: QueryKeys().certificateImages(2),
      path: ApiPaths().certificateImages(2),
    );
    final imageData = getGalleryList(image.data);
    final imageCount = imageData.length;

    int remainingImage = 8 - imageCount;
    if (remainingImage < 0) {
      remainingImage = 0;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [ColorUtils.subOrange, ColorUtils.primary]),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(20),
                  child: IconButton(
                    onPressed: () => _navigateToBefore(context),
                    icon: const Icon(Icons.navigate_before,
                        color: ColorUtils.black, size: 50),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: GridView.count(
                    padding: const EdgeInsets.all(10),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10,
                    children: [
                      ...List.generate(
                        imageCount,
                        (index) => QuestImage(gallery: imageData[index]),
                      ),
                      ...List.generate(
                        remainingImage,
                        (index) => DottedBorder(
                          child: Container(),
                          color: ColorUtils.grey05,
                          strokeWidth: 1,
                          radius: const Radius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_navigateToBefore(context) async {
  Navigator.pop(context);
}

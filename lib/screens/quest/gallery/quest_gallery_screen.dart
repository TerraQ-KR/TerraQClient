import 'package:flutter/material.dart';
import 'package:eco_reward_app/routes.dart';
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
    var mid = Arguments(QueryParams(context)).mid;

    final image = cachedQuery(
      queryKey: QueryKeys.certificateImages(mid),
      path: ApiPaths().certificateImages(mid),
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
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [ColorUtils.subOrange, ColorUtils.primary]),
          ),
          child: SafeArea(
            child: Stack(
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
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.all(40),
                  child: Text(
                    'Gallery',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                Center(
                  child: FractionallySizedBox(
                    widthFactor: 0.9,
                    child: Container(
                      margin: const EdgeInsets.only(top: 100),
                      padding: const EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        color: ColorUtils.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Text(
                            '''Out of a total N quests,
                          Accumulated $imageCount achievements''',
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.center,
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
                                  (index) => Hero(
                                      tag: '${imageData[index].id}',
                                      child: QuestImage(
                                          gallery: imageData[index])),
                                ),
                                ...List.generate(
                                  remainingImage,
                                  (index) => DottedBorder(
                                    color: ColorUtils.grey07,
                                    strokeWidth: 1,
                                    radius: const Radius.circular(10),
                                    child: Container(),
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

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:eco_reward_app/screens/quest/detail/style/detail_theme.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/quest_infrom_box.dart';
import 'package:eco_reward_app/screens/quest/main/widget/tag_quest_people.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/tag_quest_foot.dart';
import 'package:eco_reward_app/network/provider/api_path.dart';
import 'package:eco_reward_app/network/provider/query_keys.dart';
import 'package:eco_reward_app/network/custom_jobs.dart';
import 'package:eco_reward_app/screens/quest/gallery/models/get_image.dart';

class ContainerQuestDetailDone extends HookWidget {
  final int id;
  final String questName;
  final String startDate;
  final String endDate;

  const ContainerQuestDetailDone({
    Key? key,
    required this.id,
    required this.questName,
    required this.startDate,
    required this.endDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final detailImg = [];
    // int detailImgCount = 0;
    final img = cachedQuery(
      queryKey: QueryKeys().certificateImages(1),
      path: ApiPaths().certificateImages(1),
    );
    final imageData = getGalleryList(img.data);
    // final imageCount = imageData.length;
    // for (var i = 0; i < imageCount; i++) {
    //   if (imageData[i].id == id) {
    //     detailImg.add(imageData[i].image);
    //     detailImgCount++;
    //   }
    // }

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Text(
              questName,
              style: detailTheme.textTheme.titleMedium,
            ),
          ),
          const Row(
            children: [
              Padding(padding: EdgeInsets.all(20), child: TagQuestFoot()),
              TagQuestPeople(quest_user_count: 100),
            ],
          ),
          QuestInformBox(
            startDate: startDate,
            endDate: endDate,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: FractionallySizedBox(
              widthFactor: 0.9,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  // ignore: prefer-const-border-radius
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      'Certificate Image',
                    ),
                    Container(
                      height: 200,
                      width: 200,
                      margin: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Image.network(
                          imageData[0].image!,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

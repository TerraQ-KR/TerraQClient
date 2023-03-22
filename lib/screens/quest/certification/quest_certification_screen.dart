import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/services.dart';
import 'package:eco_reward_app/screens/quest/main/quest_tab_screen.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/utils/font_utils.dart';
import 'package:eco_reward_app/network/custom_jobs.dart';
import 'package:eco_reward_app/network/provider/api_paths.dart';
import 'package:eco_reward_app/network/provider/query_keys.dart';
import 'package:image_picker/image_picker.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/button_quest_detail.dart';

import '../main/style/main_theme.dart';

class QuestCertificationScreen extends StatefulHookWidget {
  final XFile? image;
  const QuestCertificationScreen({required this.image, Key? key})
      : super(key: key);

  @override
  _QuestCertificationScreen createState() => _QuestCertificationScreen();
}

class _QuestCertificationScreen extends State<QuestCertificationScreen> {
  // ignore: unused_field

  @override
  void initState() {
    super.initState();
  }

  Widget showImage() {
    final image = widget.image;
    // ignore: newline-before-return
    return Container(
        color: ColorUtils.grey07,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: FileImage(File(image!.path)),
              fit: BoxFit.cover,
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    final imageQuery = cachedQuery(
      queryKey: QueryKeys().certificateImages(1),
      path: ApiPaths.certificateImages(1),
    );

    final imageMutation = cachedMutation(
      mutationKey: 'certificateImage',
      apiType: 'patch',
      path: ApiPaths.updateCertificateImage(1),
      options: Options(contentType: 'multipart/form-data'),
    );

    return Scaffold(
      backgroundColor: ColorUtils.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () => _navigateToBefore(context),
                  icon: const Icon(Icons.navigate_before,
                      color: ColorUtils.white, size: 50),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.2),
                child: const Text(
                  'Certificate Image',
                  style: TextStyle(
                    color: ColorUtils.white,
                    fontSize: 25,
                    fontFamily: FontUtils.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 25, bottom: 50),
            child: showImage(),
          ),
          ButtonQuestDetail(
              text: 'Upload',
              // ignore: prefer-extracting-callbacks
              onPressed: () async {
                await imageQuery.refetch();

                try {
                  final formData = FormData.fromMap({
                    'file': await MultipartFile.fromFile(
                      widget.image!.path,
                    )
                  });

                  imageMutation.mutate(
                    formData,
                    onData: (payload, variables, context) =>
                        imageQuery.refetch(),
                  );
                  _showDialog(context);
                  // ignore: prefer-extracting-callbacks
                } catch (e) {
                  print(e);
                }
                // ignore: await_only_futures
              }),
        ],
      ),
    );
  }
}

_navigateToBefore(context) async {
  return Navigator.pop(context);
}

void _showDialog(context) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("This quest is certified.",
              style: questTheme.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              )),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Timer(
                    const Duration(seconds: 3),
                    () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QuestTabScreen(),
                          ),
                        ));
              },
            ),
          ],
        );
      },
    );

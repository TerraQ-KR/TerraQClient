import 'dart:io';
import 'package:dio/dio.dart';
import 'package:eco_reward_app/style/default_theme.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:day/day.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:eco_reward_app/routes.dart';
import 'package:eco_reward_app/screens/quest/detail/model/get_detail.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/utils/font_utils.dart';
import 'package:eco_reward_app/network/custom_jobs.dart';
import 'package:eco_reward_app/network/provider/api_paths.dart';
import 'package:eco_reward_app/network/provider/query_keys.dart';
import 'package:eco_reward_app/screens/quest/certification/widget/image_icon_button.dart';

class QuestImageScreen extends StatefulHookWidget {
  const QuestImageScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _QuestImageScreen createState() => _QuestImageScreen();
}

class _QuestImageScreen extends State<QuestImageScreen> {
  bool isEnabled = false;
  XFile? _image;
  final picker = ImagePicker();
  final now = Day();

  @override
  void initState() {
    super.initState();
  }

  Widget showImage() {
    return Container(
        color: ColorUtils.grey07,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        child: Center(
            child: _image == null ||
                    _image!.path.isEmpty ||
                    !File(_image!.path).existsSync()
                ? Text(
                    '${now.month()} ${now.date()}th ${now.hour()}:${now.minute()}')
                : Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(File(_image!.path)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    var memDoId = memDoIdArguments(QueryParams(context)).memdoid;

    final quest = cachedQuery(
        queryKey: QueryKeys.myQuestDetailView(memDoId),
        path: ApiPaths.myQuestDetailView(memDoId));

    getDetail questData = getdetail(quest.data);
    Future<void> getImage() async {
      final certificateImage = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 30,
      );

      if (certificateImage != null) {
        final bytes = await certificateImage.readAsBytes();
        final decodeImage = img.decodeImage(bytes);
        final resizedImage =
            img.copyResize(decodeImage!, width: 800, height: 600);
        final now = DateTime.now();
        final timeText = '${now.year}-${now.month}-${now.day}';
        final rewardText = '${questData.reward.toString()}kg';
        img.drawString(
            resizedImage, font: img.arial24, x: 120, y: 400, timeText);
        img.drawString(
            resizedImage, font: img.arial24, x: 120, y: 450, rewardText);
        img.drawString(
            resizedImage,
            font: img.arial24,
            x: 120,
            y: 350,
            questData.questName);
        img.drawString(
            resizedImage, font: img.arial24, x: 700, y: 10, 'TerraQ');

        var encodeImage = img.encodeJpg(resizedImage, quality: 100);
        var finalImage = File(certificateImage.path)
          ..writeAsBytesSync(encodeImage);

        setState(() {
          _image = XFile(finalImage.path);
          print(_image!.path);
        });
      }
    }

    var mid = Arguments(QueryParams(context)).mid;

    final imageQuery = cachedQuery(
      queryKey: QueryKeys.certificateImages(mid),
      path: ApiPaths.certificateImages(mid),
    );

    final imageMutation = cachedMutation(
      mutationKey: 'certificateImage',
      apiType: 'patch',
      path: ApiPaths.updateCertificateImage(mid),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ImageIconButton(
                icon: Icons.camera,
                // ignore: prefer-extracting-callbacks
                onPressed: () async {
                  await getImage();

                  if (_image != null) {
                    setState(() {
                      isEnabled = true;
                    });
                  }
                },
              ),
              ImageIconButton(
                icon: Icons.upload,
                onPressed: () async {
                  try {
                    final formData = FormData.fromMap({
                      'file': await MultipartFile.fromFile(
                        _image!.path,
                        filename: 'certificateImage',
                      )
                    });

                    imageMutation.mutate(
                      formData,
                      onData: (payload, variables, context) =>
                          imageQuery.refetch(),
                    );
                    _showDialog(context, mid);
                    // ignore: prefer-extracting-callbacks
                  } catch (e) {
                    //alert error message
                    AlertDialog(
                      title: Text("Error",
                          style: defaultTheme.textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                      actions: [
                        TextButton(
                          child: const Text("OK"),
                          onPressed: () {
                            Navigator.pushNamed(
                                context,
                                RouteParams(
                                    path: Routes.start,
                                    queryParameters: {
                                      Routes.memberKey: mid.toString()
                                    }));
                          },
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

_navigateToBefore(context) async {
  return Navigator.pop(context);
}

void _showDialog(context, mid) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("This quest is certified.",
              style: defaultTheme.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              )),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Timer(
                    const Duration(seconds: 3),
                    () => Navigator.pushNamed(
                        context,
                        RouteParams(path: Routes.start, queryParameters: {
                          Routes.memberKey: mid.toString()
                        })));
              },
            ),
          ],
        );
      },
    );

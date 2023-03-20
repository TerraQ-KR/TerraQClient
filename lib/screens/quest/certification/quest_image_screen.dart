import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:day/day.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:eco_reward_app/network/custom_jobs.dart';
import 'package:eco_reward_app/network/provider/api_paths.dart';
import 'package:eco_reward_app/network/provider/query_keys.dart';
import 'package:eco_reward_app/screens/quest/gallery/models/get_image.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/utils/font_utils.dart';
import 'package:eco_reward_app/screens/quest/certification/widget/image_icon_button.dart';

class QuestImageScreen extends StatefulHookWidget {
  const QuestImageScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _QuestImageScreen createState() => _QuestImageScreen();
}

class _QuestImageScreen extends State<QuestImageScreen> {
  XFile? _image;
  final picker = ImagePicker();
  final now = Day();
  @override
  void initState() {
    super.initState();
  }

  Future<void> getImage() async {
    final certificateImage = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 30,
    );

    if (certificateImage != null) {
      final bytes = await certificateImage.readAsBytes();
      final decodeImage = img.decodeImage(bytes);
      final now = DateTime.now();
      final timeText =
          '${now.year}-${now.month}-${now.day}-${now.hour}-${now.minute}-${now.second}';
      img.drawString(decodeImage!, font: img.arial24, x: 100, y: 10, timeText);
      var encodeImage = img.encodeJpg(decodeImage, quality: 100);
      var finalImage = File(certificateImage.path)
        ..writeAsBytesSync(encodeImage);

      setState(() {
        _image = XFile(finalImage.path);
        print(_image!.path);
      });
    }
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

    var imageQuery = cachedQuery(
      queryKey: QueryKeys().certificateImages(1),
      path: ApiPaths.certificateImages(1),
    );

    final images = getGalleryList(imageQuery.data);

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
          ImageIconButton(
            icon: Icons.circle_outlined,
            // ignore: prefer-extracting-callbacks
            onPressed: () async {
              await getImage();
              // ignore: unused_local_variable
              if (_image != null) {
                var formData = FormData.fromMap({
                  'file': MultipartFile.fromFile(
                    _image!.path,
                  )
                });

                imageMutation.mutate(
                  formData,
                  onData: (payload, variables, context) => imageQuery.refetch(),
                );
                // ignore: use_build_context_synchronously

                // ignore: prefer-extracting-callbacks
                Timer(const Duration(milliseconds: 3000), () {
                  Navigator.pop(context);
                });
              }
            },
          ),
        ],
      ),
    );
  }
}

_navigateToBefore(context) async {
  return Navigator.pop(context);
}

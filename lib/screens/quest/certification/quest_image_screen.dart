import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:eco_reward_app/network/custom_jobs.dart';
import 'package:eco_reward_app/network/provider/api_paths.dart';
import 'package:eco_reward_app/network/provider/query_keys.dart';
import 'package:image_picker/image_picker.dart';
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
  Future<void> getImage() async {
    final image = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 75,
      maxWidth: 75,
      imageQuality: 30,
    );

    if (image != null) {
      setState(() {
        _image = image;
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
            child: _image == null
                ? const Text('No image selected.')
                : Image.file(File(_image!.path))));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    var imageQuery = cachedQuery(
      queryKey: QueryKeys().certificateImages(1),
      path: ApiPaths.certificateImages(1),
    );

    var images = imageQuery.data;

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
                  'Quest Name',
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

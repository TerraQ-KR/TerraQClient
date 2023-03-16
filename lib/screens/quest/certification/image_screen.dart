import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/screens/quest/certification/widget/image_icon_button.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ImageScreen createState() => _ImageScreen();
}

class _ImageScreen extends State<ImageScreen> {
  XFile? _image;
  final picker = ImagePicker();

  // ignore: strict_raw_type
  Future getImage(ImageSource imageSource) async {
    try {
      final image = await picker.pickImage(source: imageSource);

      setState(() {
        _image = XFile(image!.path); // 가져온 이미지를 _image에 저장
      });
    } catch (e) {
      print(e);
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

    return Scaffold(
        backgroundColor: ColorUtils.grey06,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 25, bottom: 50),
              child: showImage(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ImageIconButton(
                  icon: Icons.add_a_photo,
                  // ignore: prefer-extracting-callbacks
                  onPressed: () {
                    getImage(ImageSource.camera);
                  },
                ),
                ImageIconButton(
                  icon: Icons.wallpaper,
                  // ignore: prefer-extracting-callbacks
                  onPressed: () {
                    getImage(ImageSource.gallery);
                  },
                ),
              ],
            )
          ],
        ));
  }
}

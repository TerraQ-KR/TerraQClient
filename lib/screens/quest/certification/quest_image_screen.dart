import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:day/day.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/utils/font_utils.dart';
import 'package:eco_reward_app/screens/quest/certification/widget/image_icon_button.dart';
import 'package:eco_reward_app/screens/quest/certification/quest_certification_screen.dart';

class QuestImageScreen extends StatefulHookWidget {
  final String questName;
  final double reward;
  const QuestImageScreen(this.questName, this.reward, {Key? key})
      : super(key: key);

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
      final timeText = '${now.year}-${now.month}-${now.day}';
      final rewardText = '${widget.reward.toString()}kg';
      img.drawString(decodeImage!, font: img.arial24, x: 100, y: 400, timeText);
      img.drawString(
          decodeImage, font: img.arial24, x: 100, y: 450, rewardText);
      img.drawString(
          decodeImage, font: img.arial24, x: 100, y: 350, widget.questName);
      img.drawString(decodeImage, font: img.arial24, x: 450, y: 10, 'TerraQ');

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

              if (_image != null) {
                _navigateToConfirmScreen(context, _image);
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

_navigateToConfirmScreen(context, image) async {
  return Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => QuestCertificationScreen(image: image)),
  );
}

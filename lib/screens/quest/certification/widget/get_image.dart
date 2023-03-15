import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';

class ImgUploader extends StatefulHookWidget {
  const ImgUploader({Key? key}) : super(key: key);

  @override
  State<ImgUploader> createState() => _ImgUploaderState();
}

class _ImgUploaderState extends State<ImgUploader> {
  final ImagePicker _picker = ImagePicker();
  PickedFile? image;
  @override
  void initState() {
    super.initState();
  }

  Future<void> sendImage() async {
    final img = await _picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 75,
      maxWidth: 75,
      imageQuality: 30,
    );

    if (img != null) {
      setState(() {
        image = img as PickedFile?;
        print(image!.path);
      });
    }
  }

//
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

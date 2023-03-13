// ignore_for_file: camel_case_types

import 'dart:math';

import 'package:dio/dio.dart';
import 'package:eco_reward_app/network/custom_jobs.dart';
import 'package:eco_reward_app/network/provider/api_paths.dart';
import 'package:eco_reward_app/network/provider/query_keys.dart';
import 'package:eco_reward_app/routes.dart';
import 'package:eco_reward_app/screens/profile/components/imageSkeleton.dart';
import 'package:eco_reward_app/screens/profile/model/member_profile.dart';
import 'package:eco_reward_app/utils/font_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';

class personalProfile extends HookWidget {
  final String personalTitle = "nickname";

  const personalProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();
    // XFile? selectImage = await picker.pickImage(source: ImageSource.gallery,
    // maxHeight: 75, maxWidth: 75, imageQuality: 30,);

    Size deviceSize = MediaQuery.of(context).size;
    double pixelWidth = deviceSize.width;

    var mid = Arguments(QueryParams(context)).mid;

    var profileQuery = cachedQuery(
      queryKey: QueryKeys.memberdetail(mid),
      path: ApiPaths.memberdetail(mid),
    );

    MemberProfile profile = memberProfile(profileQuery.data);

    return Padding(
      padding: EdgeInsets.all(0.025 * pixelWidth),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ImageSkeleton(
              imageUrl: profile.imageUrl, imageSize: 0.25 * pixelWidth),
          const ImgUploader(),
          SizedBox(width: min(0.08 * pixelWidth, 25)),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(profile.title,
                    style: TextStyle(
                      fontSize: min(0.05 * pixelWidth, 15),
                      fontWeight: FontWeight.w700,
                      fontFamily: FontUtils.primary,
                    )),
                // SizedBox(height: max(0.02 * pixelWidth, 5)),
                Text(profile.nickname,
                    style: TextStyle(
                      fontSize: min(0.067 * pixelWidth, 32),
                      fontWeight: FontWeight.w700,
                      fontFamily: FontUtils.bold,
                    )),
              ])
        ],
      ),
    );
  }
}

class ImgUploader extends StatefulHookWidget {
  const ImgUploader({super.key});

  @override
  State<ImgUploader> createState() => _ImgUploaderState();
}

class _ImgUploaderState extends State<ImgUploader> {
  final ImagePicker _picker = ImagePicker();
  late dynamic image;

  void sendImage() async {
    final img = await _picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 75,
      maxWidth: 75,
      imageQuality: 30,
    );

    if (img != null) {
      setState(() {
        image = img.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var mid = Arguments(QueryParams(context)).mid;

    final imageMutation = cachedMutation(
        mutationKey: "memberImage",
        apiType: "patch",
        path: ApiPaths.updateMemberImage(mid),
        options: Options(
          contentType: 'multipart/form-data',
        ));

    return IconButton(
        // ignore: prefer-extracting-callbacks
        onPressed: () async {
          sendImage();
          // ignore: unused_local_variable
          var formData =
              FormData.fromMap({'image': await MultipartFile.fromFile(image)});

          imageMutation.mutate(
            formData,
            onError: (payload, variables, context) =>
                {print("Error on image managing")},
          );
        },
        icon: const Icon(Icons.camera_alt_rounded));
  }
}

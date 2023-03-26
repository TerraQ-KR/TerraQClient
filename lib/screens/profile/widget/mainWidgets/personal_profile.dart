// ignore_for_file: camel_case_types

import 'dart:math';

import 'package:dio/dio.dart';
import 'package:eco_reward_app/network/custom_jobs.dart';
import 'package:eco_reward_app/network/provider/api_paths.dart';
import 'package:eco_reward_app/network/provider/query_keys.dart';
import 'package:eco_reward_app/routes.dart';
import 'package:eco_reward_app/screens/profile/components/imageSkeleton.dart';
import 'package:eco_reward_app/screens/profile/model/member_profile.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
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
    ImagePicker picker = ImagePicker();
    // XFile? selectImage = await picker.pickImage(source: ImageSource.gallery,
    // maxHeight: 75, maxWidth: 75, imageQuality: 30,);

    Size deviceSize = MediaQuery.of(context).size;
    double pixelWidth = deviceSize.width;
    double pixelHeight = deviceSize.height;

    var mid = Arguments(QueryParams(context)).mid;

    var profileQuery = cachedQuery(
      queryKey: QueryKeys.memberdetail(mid),
      path: ApiPaths.memberdetail(mid),
    );

    MemberProfile profile = memberProfile(profileQuery.data);

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              ImageSkeleton(
                  imageUrl: profile.imageUrl, imageSize: 0.28 * pixelWidth),
              const ImgUploader(),
            ],
          ),
          SizedBox(width: min(0.06 * pixelWidth, 10)),
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

// ignore: prefer-single-widget-per-file
class ImgUploader extends StatefulHookWidget {
  const ImgUploader({super.key});

  @override
  State<ImgUploader> createState() => _ImgUploaderState();
}

class _ImgUploaderState extends State<ImgUploader> {
  final ImagePicker _picker = ImagePicker();
  XFile? image;
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
        image = img;
        print(image!.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var mid = Arguments(QueryParams(context)).mid;

    var profileQuery = cachedQuery(
      queryKey: QueryKeys.memberdetail(mid),
      path: ApiPaths.memberdetail(mid),
    );

    final imageMutation = cachedMutation(
        mutationKey: "memberImage",
        apiType: "patch",
        path: ApiPaths.updateMemberImage(mid),
        options: Options(
          contentType: 'multipart/form-data',
        ));

    return ElevatedButton(
        // ignore: prefer-extracting-callbacks
        onPressed: () async {
          await sendImage();
          // ignore: unused_local_variable
          if (image != null) {
            var formData = FormData.fromMap({
              'file': await MultipartFile.fromFile(
                image!.path,
              )
            });

            imageMutation.mutate(
              formData,
              onData: (payload, variables, context) => profileQuery.refetch(),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: ColorUtils.white,
          foregroundColor: ColorUtils.black,
          padding: const EdgeInsets.all(10),
        ),
        child: const Icon(Icons.camera_alt_rounded, size: 18));
  }
}

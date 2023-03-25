import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:eco_reward_app/routes.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/style/default_theme.dart';
import 'package:eco_reward_app/screens/tutorial/widget/button_tutorial.dart';

// 12개 선택지 -> 선택 -> 확인 팝업창 -> 확인 누르면 다음 페이지, 취소 누르면 다시 선택지로 돌아감

class TutorialScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    double pixelHeight = deviceSize.height;
    double pixelWidth = deviceSize.width;

    var mid = Arguments(QueryParams(context)).mid;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [ColorUtils.primary, ColorUtils.subBlue],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: pixelHeight * 0.05),
                child: Text('Tutorial Screen',
                    style: defaultTheme.textTheme.titleLarge!
                        .copyWith(fontSize: 20)),
              ),
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: pixelHeight * 0.1),
                child: Text('Choose your MBTI',
                    style: defaultTheme.textTheme.bodyMedium!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: EdgeInsets.only(top: pixelHeight * 0.2),
                child: GridView.count(
                  padding: EdgeInsets.fromLTRB(
                      pixelWidth * 0.05, 0, pixelWidth * 0.05, 0),
                  crossAxisSpacing: pixelWidth * 0.05,
                  mainAxisSpacing: pixelHeight * 0.02,
                  crossAxisCount: 3,
                  // ignore: prefer-extracting-callbacks
                  children: List.generate(
                    12,
                    (index) => SizedBox(
                      width: pixelWidth * 0.25,
                      height: pixelHeight * 0.02,
                      child: ButtonTutorial(
                        text: mbtiList[index],
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => navigateToStart(context, mid),
                child: Text('Show Dialog'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

navigateToStart(context, mid) => Navigator.pushNamed(
    context,
    RouteParams(
        path: Routes.start,
        queryParameters: {Routes.memberKey: mid.toString()}));

List<String> mbtiList = [
  'ISTJ',
  'ISFJ',
  'INFJ',
  'INTJ',
  'ISTP',
  'ISFP',
  'INFP',
  'INTP',
  'ESTP',
  'ESFP',
  'ENFP',
  'ENTP',
  'ESTJ',
  'ESFJ',
  'ENFJ',
  'ENTJ',
];

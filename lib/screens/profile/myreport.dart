import 'package:eco_reward_app/routes.dart';
import 'package:eco_reward_app/screens/profile/components/childAppbar.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyReport extends StatelessWidget {
  const MyReport({super.key});

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
        appBar: ChildAppBar(context, "Report"),
        body: Container(
          margin: EdgeInsets.all(0.017 * pixelHeight),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: ColorUtils.white,
          ),
          child: Container(
              margin: EdgeInsets.all(0.034 * pixelHeight),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CircularPercentIndicator(
                        radius: 0.3 * pixelWidth,
                        lineWidth: 20.0,
                        animation: true,
                        percent: 30 / 100,
                        center: const Text(
                          "30 %",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: ColorUtils.black),
                        ),
                        backgroundColor: ColorUtils.grey06,
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: ColorUtils.subBlue,
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}

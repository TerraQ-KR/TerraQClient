// ignore_for_file: unused_local_variable, avoid-nested-conditional-expressions

import 'package:eco_reward_app/network/custom_jobs.dart';
import 'package:eco_reward_app/network/provider/api_paths.dart';
import 'package:eco_reward_app/network/provider/query_keys.dart';
import 'package:eco_reward_app/routes.dart';
import 'package:eco_reward_app/screens/profile/components/childAppbar.dart';
import 'package:eco_reward_app/screens/profile/constants/profile_icons.dart';
import 'package:eco_reward_app/screens/profile/model/report.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/utils/font_utils.dart';
import 'package:eco_reward_app/utils/list_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyReport extends HookWidget {
  const MyReport({super.key});

  @override
  Widget build(BuildContext context) {
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
        appBar: ChildAppBar(
          context,
          "Report",
        ),
        body: Container(
          margin: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: ColorUtils.white,
          ),
          child: Container(
              margin: const EdgeInsets.all(20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        WeeklyReport(),
                        SizedBox(
                          height: 30,
                        ),
                        MonthlyReport(),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

// ignore: prefer-single-widget-per-file
class WeeklyReport extends HookWidget {
  const WeeklyReport({super.key});

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    double pixelWidth = deviceSize.width;

    var mid = Arguments(QueryParams(context)).mid;

    var weekQuery = cachedQuery(
      queryKey: QueryKeys.weeklyReport(mid),
      path: ApiPaths.weeklyReport(mid),
    );
    var monthQuery = cachedQuery(
      queryKey: QueryKeys.monthlyReport(mid),
      path: ApiPaths.monthlyReport(mid),
    );

    Report weekly = report(weekQuery.data);
    Report monthly = report(monthQuery.data);

    late List<double> weeklyStatistics;
    List<String> categoreys = ["House", "Consumption", "Food", "Transport"];
    late List<double> temp;
    late double sumOfWeek;

    if (weekQuery.hasData && !weekQuery.isLoading && !weekQuery.isError) {
      weeklyStatistics = [
        weekly.homeReward,
        weekly.consumptionReward,
        weekly.foodReward,
        weekly.transportReward
      ];

      sumOfWeek = weekly.homeReward +
          weekly.consumptionReward +
          weekly.foodReward +
          weekly.transportReward;

      temp = [
        weekly.homeReward,
        weekly.consumptionReward,
        weekly.foodReward,
        weekly.transportReward
      ];

      temp.sort();

      return Column(
        children: [
          const Text(
            "Weekly Report",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: FontUtils.primary,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CircularPercentIndicator(
            radius: 120,
            lineWidth: 20.0,
            animation: true,
            percent: weekly.totalQuest != 0
                ? weekly.doneQuest / weekly.totalQuest
                : 0.0,
            center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: const Offset(5, 0),
                  child: const Icon(
                    ProfileIcons.clap_hands_svgrepo_com,
                    size: 95,
                    color: ColorUtils.subOrange,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  weekly.totalQuest != 0
                      ? "${(weekly.doneQuest / weekly.totalQuest * 100).toInt().toString()}%"
                      : "0%",
                  style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: ColorUtils.black),
                ),
              ],
            ),
            backgroundColor: ColorUtils.grey05,
            progressColor: ColorUtils.subBlue,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                "Decreased by",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                " ${sumOfWeek.toString()} kg ",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: ColorUtils.subBlue,
                ),
              ),
              const Icon(
                Icons.arrow_downward_rounded,
                size: 18,
                color: ColorUtils.subBlue,
              )
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: ColorUtils.grey05,
                ),
                width: pixelWidth - 64,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.energy_savings_leaf),
                        const SizedBox(width: 10),
                        Text(
                            "${categoreys.safe(weeklyStatistics.indexOf(temp.first)).toString()} achivement not enough!",
                            style: const TextStyle(
                              fontFamily: FontUtils.primary,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "This week's carbon footprint reduction is ${sumOfWeek.toString()}. Completed ${weekly.doneQuest} out of a total of ${weekly.totalQuest} quests.\n\nThis week the average category achievement rate of others is the same as ~~. Out of ${weekly.doneQuest}, the ${categoreys.safe(weeklyStatistics.indexOf(temp.first)).toString()} category is insufficient. ~~'s efforts can make ~~ as clean as ~~! Next week ${categoreys.safe(weeklyStatistics.indexOf(temp.first)).toString()} let's achieve more categories!",
                      style: const TextStyle(
                        fontFamily: FontUtils.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      );
    }

    return Column(
      children: [
        const Text(
          "Weekly Report",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: FontUtils.primary,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CircularPercentIndicator(
          radius: 120,
          lineWidth: 20.0,
          animation: true,
          percent: weekly.doneQuest / weekly.totalQuest,
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                ProfileIcons.clap_hands_svgrepo_com,
                size: 95,
                color: ColorUtils.subOrange,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "${(weekly.doneQuest / weekly.totalQuest * 100).toInt().toString()}%",
                style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: ColorUtils.black),
              ),
            ],
          ),
          backgroundColor: ColorUtils.grey05,
          progressColor: ColorUtils.subBlue,
        ),
      ],
    );
  }
}

// ignore: prefer-single-widget-per-file
class MonthlyReport extends HookWidget {
  const MonthlyReport({super.key});

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    double pixelWidth = deviceSize.width;

    var mid = Arguments(QueryParams(context)).mid;

    var weekQuery = cachedQuery(
      queryKey: QueryKeys.weeklyReport(mid),
      path: ApiPaths.weeklyReport(mid),
    );
    var monthQuery = cachedQuery(
      queryKey: QueryKeys.monthlyReport(mid),
      path: ApiPaths.monthlyReport(mid),
    );

    Report monthly = report(monthQuery.data);

    late List<double> monthlyStatistics;
    List<String> categoreys = ["House", "Consumption", "Food", "Transport"];
    late List<double> temp;
    late double percent;

    if (monthQuery.hasData && !monthQuery.isLoading && !monthQuery.isError) {
      monthlyStatistics = [
        monthly.homeReward,
        monthly.consumptionReward,
        monthly.foodReward,
        monthly.transportReward
      ];

      percent = ((monthly.foodReward +
              monthly.homeReward +
              monthly.transportReward +
              monthly.consumptionReward) /
          20.8);

      temp = [
        monthly.homeReward,
        monthly.consumptionReward,
        monthly.foodReward,
        monthly.transportReward
      ];

      temp.sort();

      return Column(
        children: [
          const Text(
            "Monthly Report",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: FontUtils.primary,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Transform.translate(
            offset: const Offset(-5, -5),
            child: Container(
              alignment: FractionalOffset(percent <= 1.0 ? percent : 1.0,
                  percent <= 1.0 ? 1 - percent : 0.0),
              width: pixelWidth - 74,
              child: const FractionallySizedBox(
                child: Icon(
                  ProfileIcons.carbonprint,
                  size: 20,
                  color: ColorUtils.subBlue,
                ),
              ),
            ),
          ),
          LinearPercentIndicator(
            padding: EdgeInsets.zero,
            percent: percent <= 1.0 ? percent : 1.0,
            center: Text(
                "${(monthly.foodReward + monthly.homeReward + monthly.transportReward + monthly.consumptionReward).toString()} kg / 20.8 kg",
                style: const TextStyle(
                  color: ColorUtils.grey07,
                  fontSize: 15,
                )),
            lineHeight: 20,
            backgroundColor: ColorUtils.grey05,
            progressColor: ColorUtils.subBlue,
            width: pixelWidth - 64,
            animation: true,
            animationDuration: 1000,
            barRadius: const Radius.circular(10),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                "Decreased by ",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "${(monthly.foodReward + monthly.homeReward + monthly.transportReward + monthly.consumptionReward).toString()} kg ",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: ColorUtils.subBlue,
                ),
              ),
              const Icon(
                Icons.arrow_downward_rounded,
                size: 18,
                color: ColorUtils.subBlue,
              )
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: ColorUtils.grey05,
                ),
                width: pixelWidth - 64,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.energy_savings_leaf),
                        const SizedBox(width: 10),
                        Text(
                            "${categoreys.safe(monthlyStatistics.indexOf(temp.first)).toString()} achivement not enough!",
                            style: const TextStyle(
                              fontFamily: FontUtils.primary,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      percent <= 0.3
                          ? "This month's carbon footprint reduction is ${((percent * 10000).roundToDouble() / 100).toString()}% from the monthly objective.\n\nThe monthly objective 20.8 kg is the average amount of carbon footprint to keep the earth temperture stable. It's very lacking this month, so please try a little harder!"
                          : percent <= 0.5
                              ? "This month's carbon footprint reduction is ${((percent * 10000).roundToDouble() / 100).toString()}% from the monthly objective.\n\nThe monthly objective 20.8 kg is the average amount of carbon footprint to keep the earth temperture stable. It's becoming a habit! Do your best for the rest of the time!"
                              : percent <= 0.7
                                  ? "This month's carbon footprint reduction is ${((percent * 10000).roundToDouble() / 100).toString()}% from the monthly objective.\n\nThe monthly objective 20.8 kg is the average amount of carbon footprint to keep the earth temperture stable. May be add more quests to follow up for this month."
                                  : percent <= 1.0
                                      ? "This month's carbon footprint reduction is ${((percent * 10000).roundToDouble() / 100).toString()}% from the monthly objective.\n\nThe monthly objective 20.8 kg is the average amount of carbon footprint to keep the earth temperture stable. You are nearly close for 20.8 kg. Keep up!"
                                      : "This month's carbon footprint reduction is ${((percent * 10000).roundToDouble() / 100).toString()}% from the monthly objective.\n\nThe monthly objective 20.8 kg is the average amount of carbon footprint to keep the earth temperture stable. You did a great job for this month! Keep this effort for the next month!",
                      style: const TextStyle(
                        fontFamily: FontUtils.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      );
    }

    return Column(
      children: [
        const Text(
          "Monthly Report",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: FontUtils.primary,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Transform.translate(
          offset: const Offset(-10, -5),
          child: Container(
            alignment: const FractionalOffset(0, 1 - 0),
            width: pixelWidth - 64,
            child: const FractionallySizedBox(
              child: Icon(
                ProfileIcons.carbonprint,
                size: 20,
                color: ColorUtils.subBlue,
              ),
            ),
          ),
        ),
        LinearPercentIndicator(
          padding: EdgeInsets.zero,
          percent: 0,
          lineHeight: 20,
          backgroundColor: ColorUtils.grey05,
          progressColor: ColorUtils.subBlue,
          width: pixelWidth - 64,
          animation: true,
          animationDuration: 1000,
          barRadius: const Radius.circular(10),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

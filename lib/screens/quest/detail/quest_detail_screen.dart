import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/container_quest_detail.dart';

class QuestDetailScreen extends StatefulWidget {
  const QuestDetailScreen({super.key});

  @override
  State<QuestDetailScreen> createState() => _QuestDetailScreen();
}

class _QuestDetailScreen extends State<QuestDetailScreen> {
  String BasicURl = 'http://35.216.34.93:8080/api/getMyQuestDetailView/1';
  Map<String, dynamic> responseData = {};
  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(BasicURl));
    if (response.statusCode == 200) {
      setState(() {
        responseData = jsonDecode(response.body);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [ColorUtils.subOrange, ColorUtils.primary]),
          ),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                        onPressed: () => _navigateToBefore(context),
                        icon: const Icon(Icons.navigate_before,
                            color: ColorUtils.black, size: 50),
                      ),
                      const Icon(Icons.recycling,
                          color: ColorUtils.black, size: 30),
                    ],
                  ),
                ),
                Expanded(
                  child: ContainerQuestDetail(
                    questName: '${responseData['questDto']['questName']}',
                    briefing: '${responseData['briefing']}',
                    information: '${responseData['information']}',
                    startDate: '${responseData['startDate']}',
                    endDate: '${responseData['endDate']}',
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

_navigateToBefore(context) async {
  return Navigator.pop(context);
}

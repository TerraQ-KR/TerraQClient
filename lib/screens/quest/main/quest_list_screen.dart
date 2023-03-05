import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:eco_reward_app/screens/quest/main/widget/input_quest_picture.dart';
import 'package:eco_reward_app/screens/quest/detail/widget/toolbar_quest.dart';
// API

class QuestListScreen extends StatefulWidget {
  const QuestListScreen({super.key});

  @override
  State<QuestListScreen> createState() => _QuestListScreenState();
}

class _QuestListScreenState extends State<QuestListScreen> {
  String BasicURl = 'http://35.216.34.93:8080/api/getQuestDetailView/';

  List<Map<String, dynamic>> responseData = [];
  Future<void> fetchData() async {
    for (int i = 0; i < 11; i++) {
      final questID = i;
      final response = await http.get(Uri.parse(BasicURl + questID.toString()));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.isNotEmpty) {
          setState(() {
            responseData.add(data);
          });
        }
      }
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
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          const SizedBox(height: 20),
          const ToolbarQuest(),
          Expanded(
            child: ListView.builder(
              itemCount: responseData.length,
              itemBuilder: (BuildContext context, int index) {
                final data = responseData[index];
                // ignore: newline-before-return
                return Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      InputQuestPicture(
                        subCategoryName: 'Saving',
                        questName: '${data['questName']}',
                        briefing: '${data['briefing']}',
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

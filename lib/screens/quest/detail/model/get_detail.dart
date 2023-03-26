import 'package:flutter/material.dart';

class getDetail {
  int memDoId = 0;
  String questName = '';
  int questId = 0;
  String subCategoryName = '';
  double reward = 0;
  String briefing = '';
  String information = '';
  int challenger = 0;
  String startDate = '';
  String dueDate = '';
  List<dynamic> images = [];

  getDetail();

  getDetail.fromJson(Map<String, dynamic> json)
      : memDoId = json["memDoId"],
        questName = json["questDto"]['questName'] ?? "",
        questId = json["questDto"]['questId'] ?? 0,
        subCategoryName =
            json["questDto"]['categoryDto']['subCategoryName'] ?? "",
        reward = json["questDto"]['reward'] ?? 0,
        briefing = json["questDto"]['briefing'] ?? "",
        information = json["questDto"]['information'] ?? "",
        challenger = json["questDto"]['challenger'] ?? 0,
        startDate = json["startDate"] ?? "",
        dueDate = json["dueDate"] ?? "",
        images = json["certificateImages"] ?? [];
}

getDetail getdetail(Object? json) {
  return (json == null
      ? getDetail()
      : getDetail.fromJson(json as Map<String, dynamic>));
}

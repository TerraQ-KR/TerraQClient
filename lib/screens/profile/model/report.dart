class Report {
  String firstDate = "";
  String lastDate = "";
  double homeReward = 0.0;
  double consumptionReward = 0.0;
  double foodReward = 0.0;
  double transportReward = 0.0;

  int totalQuest = 1;
  int doneQuest = 0;

  Report();

  Report.fromJson(Map<String, dynamic> json)
      : firstDate = json["firstDate"],
        lastDate = json["lastDate"],
        homeReward = json["homeRewardSum"],
        consumptionReward = json["consumptionRewardSum"],
        foodReward = json["foodRewardSum"],
        transportReward = json["transportRewardSum"],
        totalQuest = json["totalQuestCount"],
        doneQuest = json["doneQuestCount"];
}

Report report(Object? json) {
  return (json == null
      ? Report()
      : Report.fromJson(json as Map<String, dynamic>));
}

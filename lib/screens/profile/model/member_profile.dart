class MemberProfile {
  int memberid = 0;
  String title = "";
  String nickname = "";
  String imageUrl = "";
  String? mainBadge = "";
  double reward = 0;
  int progressQuests = 0;
  int successQuests = 0;
  int badgeCount = 0;
  MemberProfile();

  MemberProfile.fromJson(Map<String, dynamic> json)
      : memberid = json["memberId"],
        title = json["title"] ?? "",
        nickname = json["nickname"],
        reward = json["reward"] ?? 0.0,
        imageUrl = json["imageUrl"] ?? "",
        mainBadge = json["mainBadge"] ?? "",
        progressQuests = json["progressQuests"],
        successQuests = json["successQuests"],
        badgeCount = json["badgeCount"];
}

MemberProfile memberProfile(Object? json) {
  return (json == null
      ? MemberProfile()
      : MemberProfile.fromJson(json as Map<String, dynamic>));
}

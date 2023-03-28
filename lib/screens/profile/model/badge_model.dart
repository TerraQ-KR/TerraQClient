import 'package:eco_reward_app/screens/profile/model/category_model.dart';

class Badge {
  int bedgeId = -1;
  String badgeName = "";
  CategoryModel category = CategoryModel();
  double achieverate = 0.0;

  Badge();

  Badge.fromJson(Map<String, dynamic> json)
      : bedgeId = json["id"],
        badgeName = json["name"],
        category = categoryModel(json["category"]),
        achieverate = json["achievement"];
}

Badge badgefromJson(Object? json) {
  return (json == null
      ? Badge()
      : Badge.fromJson(json as Map<String, dynamic>));
}

class BadgeModel {
  int mgId = -1;
  Badge badge = Badge();
  bool choice = false;

  BadgeModel();

  BadgeModel.fromJson(Map<String, dynamic> json)
      : mgId = json["memberGetId"],
        badge = badgefromJson(json["badge"]),
        choice = json["choice"] == 0 ? false : true;
}

BadgeModel badgeModel(Object? json) {
  return (json == null
      ? BadgeModel()
      : BadgeModel.fromJson(json as Map<String, dynamic>));
}

List<BadgeModel?> badgeList(Object? json) {
  return (json == null
      ? []
      : (json as List<dynamic>).map((elem) {
          return badgeModel(elem);
        }).toList());
}

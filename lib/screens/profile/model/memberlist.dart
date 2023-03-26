import 'package:eco_reward_app/screens/profile/model/member_profile.dart';

List<MemberProfile?> memberList(Object? json) {
  if (json == null) {
    return [];
  }

  return (json as List<dynamic>).map((elem) {
    return memberProfile(elem);
  }).toList();
}

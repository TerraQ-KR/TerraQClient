class QueryKeys {
  static const String members = "get-all-members";

  String memberdetail(int memberId) {
    return "get-member-detail/$memberId";
  }

  String memberimage(int memberId) {
      return "get-user-image/$memberId";
  }
  
  String getMemberCategory(int memberId) {
    return "MemberCategory/$memberId";
  }

  String questDetailView(int questId) {
    return "questDetailView/$questId";
  }

  String questNotMyQuestList(int memberId) {
    return "questNotMyQuestList/$memberId";
  }

  String certificateImages(int membeerDoId) {
    return "certificateImages/$membeerDoId";
  }

  String myQuestDetailView(int memberDoId) {
    return "myQuestDetailView/$memberDoId";
  }

  String myQuestNotYetList(int memberId) {
    return "myQuestNotYetList/$memberId";
  }

  String myQuestIngList(int memberId) {
    return "myQuestIngList/$memberId";
  }

  String myQuestDoneList(int memberId) {
    return "myQuestDoneList/$memberId";
  }

  static String myBadge(int memberId) {
    return "getMyBadge/$memberId";
  }

  static String monthlyReport(int memberId) {
    return "getMonthlyReport/$memberId";
  }

  static String weeklyReport(int memberId) {
    return "getWeeklyReport/$memberId";
  }
}

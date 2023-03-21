class QueryKeys {
  static const String members = "get-all-members";

  static String memberdetail(int memberId) {
    return "get-member-detail/$memberId";
  }

  static String memberimage(int memberId) {
    return "get-user-image/$memberId";
  }

  static const getTest = "getTest";

  static String getMemberCategory(int memberId) {
    return "MemberCategory/$memberId";
  }

  static String questDetailView(int questId) {
    return "questDetailView/$questId";
  }

  static String questNotMyQuestList(int memberId) {
    return "questNotMyQuestList/$memberId";
  }

  static String certificateImages(int membeerDoId) {
    return "certificateImages/$membeerDoId";
  }

  static String myQuestDetailView(int memberDoId) {
    return "myQuestDetailView/$memberDoId";
  }

  static String myQuestNotYetList(int memberId) {
    return "myQuestNotYetList/$memberId";
  }

  static String myQuestIngList(int memberId) {
    return "myQuestIngList/$memberId";
  }

  static String myQuestDoneList(int memberId) {
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

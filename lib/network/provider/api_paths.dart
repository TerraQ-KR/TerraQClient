class ApiPaths {
  // Get
  static const String members = "/get-all-members";

  static String memberdetail(int memberId) {
    return "/get-member-detail/$memberId";
  }

  static String memberimage(int memberId) {
    return "/get-user-image/$memberId";
  }

  static const getTest = "/getTest";

  static String getMemberCategory(int memberId) {
    return "/getMemberCategory/$memberId";
  }

  static String questDetailView(int questId) {
    return "/getQuestDetailView/$questId";
  }

  static String questNotMyQuestList(int memberId) {
    return "/getQuestNotMyQuestList/$memberId";
  }

  static String certificateImages(int membeerDoId) {
    return "/getCertificateImages/$membeerDoId";
  }

  static String myQuestDetailView(int memberDoId) {
    return "/getMyQuestDetailView/$memberDoId";
  }

  static String myQuestNotYetList(int memberId) {
    return "/getMyQuestNotYetList/$memberId";
  }

  static String myQuestIngList(int memberId) {
    return "/getMyQuestIngList/$memberId";
  }

  static String myQuestDoneList(int memberId) {
    return "/getMyQuestDoneList/$memberId";
  }

  static String myBadge(int memberId) {
    return "/getMyBadge/$memberId";
  }

  static String monthlyReport(int memberId) {
    return "/getMonthlyReport/$memberId";
  }

  static String weeklyReport(int memberId) {
    return "/getWeeklyReport/$memberId";
  }

  // Post
  static const String createMember = "/create-member";
  static const String login = "/login";
  static const String postTest = "/postTest";

  static String addMyQuest(int memberId, int questId) {
    return "/add-to-my-quest/$memberId/$questId";
  }

  static const String createQeust = "/create-quest";

  static const String createMainBadge = "/createMainBadge";

  // Put
  static String updateMember(int memberId) {
    return "/update-member/$memberId";
  }

  // Delete

  // Patch??
  static String updateMemberImage(int memberId) {
    return "/update-member-image/$memberId";
  }

  static String updateCertificateImage(int memberDoId) {
    return "/uploadCertificateImage/$memberDoId";
  }

  static String updateMainBadge(int memberId) {
    return "/updateMainBadge/$memberId";
  }
}

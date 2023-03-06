class ApiPaths {
  // Get
  final String members = "/get-all-members";

  String memberdetail(int memberId) {
    return "/get-member-detail/$memberId";
  }

  String memberimage(int memberId) {
    return "/get-user-image/$memberId";
  }

  static const getTest = "/getTest";

  String getMemberCategory(int memberId) {
    return "/getMemberCategory/$memberId";
  }

  String questDetailView(int questId) {
    return "/getQuestDetailView/$questId";
  }

  String questNotMyQuestList(int memberId) {
    return "/getQuestNotMyQuestList/$memberId";
  }

  String certificateImages(int membeerDoId) {
    return "/getCertificateImages/$membeerDoId";
  }

  String myQuestDetailView(int memberDoId) {
    return "/getMyQuestDetailView/$memberDoId";
  }

  String myQuestNotYetList(int memberId) {
    return "/getMyQuestNotYetList/$memberId";
  }

  String myQuestIngList(int memberId) {
    return "/getMyQuestIngList/$memberId";
  }

  String myQuestDoneList(int memberId) {
    return "/getMyQuestDoneList/$memberId";
  }

  // Post
  final String createMember = "/create-member";
  final String login = "/login";
  final String postTest = "/postTest";

  String addMyQuest(int memberId, int questId) {
    return "/add-to-my-quest/$memberId/$questId";
  }

  final String createQeust = "/create-quest";

  // Put
  String updateMember(int memberId) {
    return "/update-member/$memberId";
  }

  // Delete

  // Patch??
  String updateMemberImage(int memberId) {
    return "update-member-image/$memberId";
  }

  String updateCertificateImage(int memberDoId) {
    return "uploadCertificateImage/$memberDoId";
  }
}

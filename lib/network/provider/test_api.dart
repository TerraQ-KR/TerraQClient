import '../BasicAPI.dart';

void getTest() async {
  var response = await API.GET(
    path: '/getTest',
  );

  print(response);
}

void postTest() async {
  String t = "violet";

  var response = await API.POST(
    path: '/postTest',
    data: t,
  );

  print(response);
}

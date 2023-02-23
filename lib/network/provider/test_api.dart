import '../BasicAPI.dart';

void getTest() {
  var response = API.GET(
    path: '/getTest',
    resFunction: testFunc,
  );
}

dynamic testFunc(dynamic res) {
  print(res);

  return res;
}

void postTest() {
  String t = "violet";

  var response = API.POST(
    path: '/postTest',
    data: t,
    resFunction: testFunc,
  );
}

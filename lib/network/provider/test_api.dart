import '../dio_config.dart';

void getTest() async {
  try {
    var response = await dio.get('/getTest');
    print(response);
  } catch (e) {
    print("##################");
  }
}

void postTest() async {
  String t = "violet";
  try {
    var response = await dio.post('/postTest', data: t);
    print(response);
  } catch (e) {
    print("-------------------------");
  }
}

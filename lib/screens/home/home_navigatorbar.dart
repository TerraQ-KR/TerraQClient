import 'package:eco_reward_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:eco_reward_app/utils/color_utils.dart';
import 'package:eco_reward_app/screens/home/home_screen.dart';
import 'package:eco_reward_app/screens/profile/profile_screen.dart';
import 'package:eco_reward_app/screens/quest/main/quest_tab_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class BottomNavigatorbar extends StatefulWidget {
  const BottomNavigatorbar({Key? key}) : super(key: key);

  @override
  _BottomNavigatorbarState createState() => _BottomNavigatorbarState();
}

class _BottomNavigatorbarState extends State<BottomNavigatorbar> {
  int _selectedIndex = 0;
  static const storage = FlutterSecureStorage();
  dynamic userInfo = '';
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const QuestTabScreen(),
    const ProfileScreen(),
  ];

  logout() async {
    await storage.delete(key: 'login');
    Navigator.pushNamed(context, Routes.login);
  }

  checkUserState() async {
    userInfo = await storage.read(key: 'login');
    if (userInfo == null) {
      print('로그인 페이지로 이동');
      Navigator.pushNamed(context, Routes.login); // 로그인 페이지로 이동
    } else {
      print('로그인 중');
    }
  }

  @override
  void initState() {
    super.initState();

    // 비동기로 flutter secure storage 정보를 불러오는 작업
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkUserState();
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/imgs/logo.png',
              width: 35,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "TerraQ",
              style: TextStyle(
                color: ColorUtils.black,
                fontStyle: FontStyle.normal,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => logout(),
            icon: const Icon(
              Icons.logout,
              color: ColorUtils.black,
            ),
            tooltip: 'logout',
          )
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tag),
            label: 'Quest',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'MyPage',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ColorUtils.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}

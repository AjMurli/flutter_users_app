import 'package:flutter/material.dart';
import 'package:flutter_users_app/HomeScreen.dart';
import 'package:flutter_users_app/NotificationScreen.dart';
import 'package:flutter_users_app/PremiumScreen.dart';
import 'package:flutter_users_app/SettingScreen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {

  int _currentIndex=0;
  List<Widget> tabs=const[
    HomeScreen(),
    NotificationScreen(),
    PremiumScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffECF2FF),
        body: SafeArea(
          child: Center(
            child: tabs[_currentIndex],
          ),
        ),
        bottomNavigationBar:BottomNavigationBar(
          backgroundColor: Color(0xff080639),
          currentIndex: _currentIndex,
          onTap: (int newIndex){
            setState(() {
              _currentIndex= newIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(
                backgroundColor: Color(0xff080639),
                label: "Home",
                icon: Icon(Icons.home)
            ), BottomNavigationBarItem(
                backgroundColor: Color(0xff080639),
                label: "Notification",
                icon: Icon(Icons.notifications)
            ), BottomNavigationBarItem(
                backgroundColor: Color(0xff080639),
                label: "Premium",
                icon: Icon(Icons.workspace_premium)
            ), BottomNavigationBarItem(
                backgroundColor: Color(0xff080639),
                label: "Setting",
                icon: Icon(Icons.settings)
            ),
          ],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.purpleAccent,
          showUnselectedLabels: true,
        )
    );
  }
}

import 'package:flutter/material.dart';
class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff120f52),
      appBar: AppBar(
        backgroundColor: Color(0xff080639),
        title: Text("Setting "),
      ),
      body: Center(child: Text("Setting Screen",style: TextStyle(color: Colors.white),)),
    );
  }
}

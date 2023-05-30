import 'package:flutter/material.dart';
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff120f52),
      appBar: AppBar(
        backgroundColor: Color(0xff080639),
        title: Text("Notification"),
      ),
      body: Center(child: Text("Notification Screen",style: TextStyle(color: Colors.white),)),
    );
  }
}

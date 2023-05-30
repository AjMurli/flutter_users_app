import 'package:flutter/material.dart';
class PremiumScreen extends StatefulWidget {
  const PremiumScreen({Key? key}) : super(key: key);

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff120f52),
      appBar: AppBar(
        backgroundColor: Color(0xff080639),
        title: Text("Premium"),
      ),
      body: Center(child: Text("Premium Screen",style: TextStyle(color: Colors.white),)),
    );
  }
}

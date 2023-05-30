import 'package:flutter/material.dart';
class UserDetailScreen extends StatefulWidget {
  final String name,email,phone,companyName;
  final int index;
  const UserDetailScreen({Key? key, required this.name,required this.email, required this.phone, required this.companyName, required this.index}) : super(key: key);

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff120f52),
      appBar: AppBar(
        backgroundColor: Color(0xff080639),
        title: Text(widget.name),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left:12,right:12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Card(
              color: Color(0xff07052f),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.purpleAccent,
                          radius: 25,
                          child: Text((widget.index + 1).toString(),style: TextStyle(color: Colors.white),),
                        ),
                        Icon(Icons.more_vert_sharp,color: Colors.white,)
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: Row(
                        children: [
                          Expanded(child: Text("Name",style: TextStyle(fontSize: 16,color: Colors.white),)),
                          Expanded(child: Text(widget.name,style: TextStyle(fontSize: 16,color: Colors.white),)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Expanded(child: Text("Email Id",style: TextStyle(fontSize: 16,color: Colors.white),),),
                        Expanded(child: Text(widget.email,style: TextStyle(fontSize: 16,color: Colors.white),),)
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Expanded(child: Text("Phone",style: TextStyle(fontSize: 16,color: Colors.white),)),
                        Expanded(child: Text(widget.phone,style: TextStyle(fontSize: 16,color: Colors.white),),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Expanded(child: Text("Company Name",style: TextStyle(fontSize: 16,color: Colors.white),)),
                        Expanded(child: Text(widget.companyName,style: TextStyle(fontSize: 16,color: Colors.white),),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            )
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'UserDetailsScreen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      setState(() {
        users = jsonDecode(response.body);
      });
    } else {
      print('Failed to fetch data');
    }
  }

  String getEmail(String name) {
    final user = users.firstWhere((user) => user['name'] == name, orElse: () => null);
    if (user != null) {
      return user['email'];
    }
    return '';
  }

  String getPhone(String name){
    final user = users.firstWhere((user) => user['name' ]== name, orElse: ()=> null);
    if(user!= null){
      return user['phone'];
    }
    return '';
  }
  String getCompanyName(String name) {
    final user = users.firstWhere((user) => user['name'] == name, orElse: () => null);
    if (user != null) {
      return user['company']['name'];
    }
    return '';
  }
// Searchable TextFormField
  String searchQuery = '';
  void onSearchChanged(String value) {
    setState(() {
      searchQuery = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff120f52),

      appBar: AppBar(
        leading: Icon(Icons.menu,color: Colors.white,),
        backgroundColor: Color(0xff080639),
        title: Text("Users"),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right:14),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.blue,
              child: Image.asset('assets/Profile.png'),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color:  Color(0xff07052f),
                  borderRadius: BorderRadius.circular(7)
              ),
              child: TextField(
                style: TextStyle(color: Colors.white),
                onChanged: onSearchChanged,
                decoration: InputDecoration(
                    hintText: 'Search by name',
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.search,color: Colors.white,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7)
                      )
                    ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                final userName = user['name'];
                // Filter the user based on the search query
                if (searchQuery.isNotEmpty && !userName.toLowerCase().contains(searchQuery.toLowerCase())) {
                  return Container(); // Return an empty container if the user doesn't match the search query
                }
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff07052f),
                  ),
                  margin: EdgeInsets.only(top:6,left:8,right:8,bottom: 0),
                  child: ListTile(
                    title: Text(userName,style: TextStyle(color: Colors.white),),
                    subtitle: Text("Read Message",style: TextStyle(color: Colors.grey),),
                    leading: CircleAvatar(
                      backgroundColor: Colors.purpleAccent,
                      child: Text((index + 1).toString(),style: TextStyle(color: Colors.white),),
                    ),
                    trailing: Image.asset('assets/forward.gif',width: 40,),
                    onTap: () {
                      final email = getEmail(userName);
                      final phone = getPhone(userName);
                      final companyName = getCompanyName(userName);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetailScreen(name: userName, email: email, phone: phone, companyName: companyName,index:index),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
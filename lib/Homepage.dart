import 'package:application_project/constant/colors.dart';
import 'package:application_project/login.dart';
import 'package:flutter/material.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => login_page()));
            },
            icon: Icon(
              Icons.logout,
              color: Colors.black,
              size: 30,
            ),
          )
        ],
      ),
      body: Text("Hi user 👋",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
    );
  }
}

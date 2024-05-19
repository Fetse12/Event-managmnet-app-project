import 'package:application_project/auth.dart';
import 'package:application_project/constant/colors.dart';
import 'package:application_project/createEvent.dart';
import 'package:application_project/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              LogoutUser();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => login_page()));
            },
            icon: Icon(
              Icons.logout,
              color: Colors.white,
              size: 30,
            ),
          )
        ],
      ),
      body: Text("Hi user 👋",
          style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w600,
              fontFamily: 'inter')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => creatEvent_page()));
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}

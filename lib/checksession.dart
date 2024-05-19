import 'package:application_project/Homepage.dart';
import 'package:application_project/auth.dart';
import 'package:application_project/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class check_session extends StatefulWidget {
  const check_session({super.key});

  @override
  State<check_session> createState() => _check_sessionState();
}

class _check_sessionState extends State<check_session> {
  @override
  void initState() {
    checkSession().then((value) {
      if (value) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home_page()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => index_page()));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

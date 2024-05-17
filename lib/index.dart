import 'package:application_project/Signup.dart';
import 'package:application_project/containers/widget.dart';
import 'package:application_project/login.dart';
import 'package:flutter/material.dart';

class index_page extends StatelessWidget {
  const index_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              SizedBox(
                height: 170,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: ' Let there be live\n',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                      TextSpan(
                          text: 'Your next best-night-ever is waiting.\n',
                          style: TextStyle(
                              fontFamily: 'inter',
                              fontSize: 16,
                              color: Colors.white)),
                      TextSpan(
                          text: '        And we have the tickets.',
                          style: TextStyle(
                              fontFamily: 'inter',
                              fontSize: 16,
                              color: Colors.white)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 240,
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      child: SizedBox(
                        width: 350,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Signup_page()));
                          },
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(
                                fontFamily: 'inter',
                                color: Colors.white,
                                fontWeight: FontWeight.w900),
                          ),
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.black,
                              side: BorderSide(
                                color: Colors.white,
                                width: 2.0,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      child: SizedBox(
                        width: 350,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => login_page()));
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontFamily: 'inter',
                                color: Colors.black,
                                fontWeight: FontWeight.w900),
                          ),
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide(
                                color: Colors.white,
                                width: 2.0,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

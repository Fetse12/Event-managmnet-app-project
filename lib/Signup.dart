import 'package:application_project/constant/colors.dart';
import 'package:application_project/containers/custome_input_form.dart';
import 'package:flutter/material.dart';

class Signup_page extends StatefulWidget {
  const Signup_page({super.key});

  @override
  State<Signup_page> createState() => _Signup_pageState();
}

class _Signup_pageState extends State<Signup_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFA1BABE),
                    Color(0xFF010B0D),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.10, 0.80],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          color: KlightGreen,
                          fontSize: 32,
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomInputForm(
                        icon: Icons.person_outline,
                        label: "Name",
                        hint: "Enter your Name"),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomInputForm(
                        icon: Icons.email,
                        label: "Email",
                        hint: "Enter your Email"),
                    SizedBox(
                      height: 20,
                    ),
                    CustomInputForm(
                        icon: Icons.lock_outline_rounded,
                        label: "Password",
                        hint: "Enter your Password"),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Sign Up",
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Color(0xFFC3E00F),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(
                              color: KlightGreen,
                              fontSize: 16,
                              fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Login",
                          style: TextStyle(
                              color: KlightGreen,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

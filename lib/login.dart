import 'package:application_project/constant/colors.dart';
import 'package:application_project/containers/custome_input_form.dart';
import 'package:flutter/material.dart';

class login_page extends StatefulWidget {
  const login_page({super.key});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            '/home/fitsum/Desktop/application_project/lib/image/LogBgImg.png',
            height: 250,
            width: 500,
          ),
          Expanded(
            child: Container(
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
                      "Login",
                      style: TextStyle(
                          color: KlightGreen,
                          fontSize: 32,
                          fontWeight: FontWeight.w800),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forget Password",
                          style: TextStyle(
                              color: KlightGreen,
                              fontSize: 16,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Login"),
                        style: OutlinedButton.styleFrom(
                            backgroundColor: KlightGreen,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "create a New Account ?",
                          style: TextStyle(
                              color: KlightGreen,
                              fontSize: 16,
                              fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Sign Up",
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

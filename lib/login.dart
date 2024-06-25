import 'package:application_project/Homepage.dart';
import 'package:application_project/Signup.dart';
import 'package:application_project/auth.dart';
import 'package:application_project/constant/colors.dart';
import 'package:application_project/containers/custome_input_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class login_page extends StatefulWidget {
  const login_page({super.key});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 1, 0, 29),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Image.asset(
                      '/home/fitsum/Desktop/application_project/image/LogBgImg.png',
                      height: 250,
                      width: 500,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomInputForm(
                        controller: _emailController,
                        icon: Icons.email,
                        label: "Email",
                        hint: "Enter your Email"),
                    SizedBox(
                      height: 20,
                    ),
                    CustomInputForm(
                        obscureText: true,
                        controller: _passwordController,
                        icon: Icons.lock_outline_rounded,
                        label: "Password",
                        hint: "Enter your Password"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forget Password",
                          style: TextStyle(
                              color: Colors.white,
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
                        onPressed: () {
                          LoginUser(_emailController.text,
                                  _passwordController.text)
                              .then((value) {
                            if (value == true) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("Login succesfully!!!")));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home_page()));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("Login Faild try again!")));
                            }
                          });
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
                    SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Signup_page())),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "create a New Account ?",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
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

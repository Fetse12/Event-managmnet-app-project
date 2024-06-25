import 'package:application_project/auth.dart';
import 'package:application_project/constant/colors.dart';
import 'package:application_project/containers/custome_input_form.dart';
import 'package:application_project/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Signup_page extends StatefulWidget {
  const Signup_page({super.key});

  @override
  State<Signup_page> createState() => _Signup_pageState();
}

class _Signup_pageState extends State<Signup_page> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 1, 0, 29),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 200,
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomInputForm(
                        controller: _nameController,
                        icon: Icons.person_outline,
                        label: "Name",
                        hint: "Enter your Name"),
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
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            createUser(
                                    _nameController.text,
                                    _emailController.text,
                                    _passwordController.text)
                                .then((value) {
                              if (value == "Success") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "Account Created succesfully")));
                                Future.delayed(Duration(seconds: 2));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => login_page()));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(value)));
                              }
                            });
                          },
                          child: Text(
                            "Sign Up",
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
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Login",
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

// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.android),
              // hello again
              Text(
                "Hello World🌍",
                style: GoogleFonts.bebasNeue(fontSize: 54),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Register below",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),

              SizedBox(
                height: 20,
              ),

              // email textfeild

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        // enabledBorder: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(12)),
                        hintText: 'Password',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: signUp,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Center(
                        child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: widget.showLoginPage,
                    child: Text(" Login now",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold)),
                  )
                ],
              )

              // sing in but

              // not a member
            ],
          ),
        ),
      ),
    );
  }
}

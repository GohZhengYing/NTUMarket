import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

Widget buildEmail() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Email',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 10),
      Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color.fromARGB(255, 71, 231, 213),
                ),
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.black38)),
          ))
    ],
  );
}

Widget buildPassword() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Password',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 10),
      Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color.fromARGB(255, 71, 231, 213),
                ),
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.black38)),
          ))
    ],
  );
}

Widget buildForgetPasswordButton() {
  return Container(
    alignment: Alignment.center,
    child: TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 20,
          color: Colors.black12,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () => print("Forgot Password Pressed"),
      child: const Text(
        'Forget Password',
        style: TextStyle(
            color: Color.fromARGB(255, 1, 78, 68)), //forget Password text color
      ),
    ),
  );
}

Widget buildLoginButton() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll<Color>(Color.fromARGB(255, 71, 231, 213)),
      ),
      onPressed: () => print("Login Pressed"),
      child: Text(
        "Login",
        style: TextStyle(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget buildSignUpButton() {
  return GestureDetector(
    onTap: () => print("Sign Up Pressed"),
    child: RichText(
      text: TextSpan(children: [
        TextSpan(
            text: "Don\'t have an account?",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w300)),
        TextSpan(
            text: 'Sign Up',
            style: TextStyle(
                color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold))
      ]),
    ),
  );
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color.fromRGBO(147, 236, 227, 1),
                      Color.fromRGBO(147, 236, 227, 0.84),
                      Color.fromRGBO(147, 236, 227, 0.64),
                      Color.fromRGBO(147, 236, 227, 0.44),
                    ])),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 120,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'NTUMarket',
                        style: TextStyle(
                            color: Color.fromARGB(255, 7, 0, 95),
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 120,
                      ),
                      buildEmail(),
                      SizedBox(
                        height: 20,
                      ),
                      buildPassword(),
                      buildForgetPasswordButton(),
                      buildLoginButton(),
                      buildSignUpButton(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

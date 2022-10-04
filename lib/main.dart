import 'dart:io';

import 'package:NtuMarket/Screens/home/home_screen.dart';
import 'package:NtuMarket/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/user.dart';
import 'models/model_provider.dart';
import 'Screens/Welcome/welcome_screen.dart';
import 'constants.dart';


void main() {

  runApp(MyApp());}
//void main() => runApp(const LoginScreen());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


 bool loggedIn = false;
 bool loading = true;

  @override
  Future<void> check() async {
    super.initState();
      bool initialize = await Initialize();
      setState(() {
        loggedIn = initialize;
      });
  }
  // This widget is the root of your application.

 @override
 void initState() {
   super.initState();
   check();
   setState(() {
     loading = false;
   });
 }

  @override
  Widget build(BuildContext context) {

    if(loading){
      return Container();
    }
  //print("Logged in:"+(loggedIn).toString());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ntu Market',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: kPrimaryColor,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: kPrimaryLightColor,
            iconColor: kPrimaryColor,
            prefixIconColor: kPrimaryColor,
            contentPadding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
          )),
      home: loggedIn? const HomeScreen() : WelcomeScreen(),
    );
  }
}

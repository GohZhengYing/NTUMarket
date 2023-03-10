import 'package:flutter/material.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../../data/model_provider.dart';
import '../../Login/login_screen.dart';
import '../../home/home_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  final email_input = TextEditingController();
  final password_input = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isPasswordCaps = false;
  bool hasNumeric = false;
  bool lowerCase = false;
  bool hasSpecialCase = false;
  bool lengthCheck = false;
  bool _isVisible = false;
  bool submitted = false;

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');
    final CapsRegex = RegExp(r'[A-Z]');
    final smallRegex = RegExp(r'[a-z]');
    final specialChar = RegExp(r'[!@#\$&*~]');

    setState(() {
      lengthCheck = false;
      if (password.length >= 8) {
        lengthCheck = true;
      }

      isPasswordCaps = false;
      if (CapsRegex.hasMatch(password)) {
        isPasswordCaps = true;
      }

      hasSpecialCase = false;
      if (specialChar.hasMatch(password)) {
        hasSpecialCase = true;
      }

      lowerCase = false;
      if (smallRegex.hasMatch(password)) {
        lowerCase = true;
      }

      hasNumeric = false;
      if (numericRegex.hasMatch(password)) {
        hasNumeric = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    if(submitted){
      return Container(
        child: Center(
          child: SizedBox(height: 50.0,
            width:50.0,
            child: CircularProgressIndicator(),
          ),
        ),
        color: Colors.white,

      );
    }


    return Form(
      key: formkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
              controller: email_input,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter valid Email";
                } else if (!RegExp(r'^[A-Z a-z]*[0-9]+@[e.ntu.edu.sg]+$')
                    .hasMatch(value!)) {
                  return "Enter NTU Email";
                } else {
                  return null;
                }
              },
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              decoration: InputDecoration(
                hintText: "Your email",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.person),
                ),
              ),
              autofillHints: [AutofillHints.email]),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: password_input,
              textInputAction: TextInputAction.done,
              obscureText: !_isVisible,
              onChanged: (password) => onPasswordChanged(password),
              validator: (value) {
                if (!RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                    .hasMatch(value!)) {
                  return "Password invalid";
                } else if (value!.isEmpty) {
                  return "Password cannot be blank";
                } else {
                  return null;
                }
              },
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },
                  icon: _isVisible
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                ),
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          Row(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: isPasswordCaps ? Colors.green : Colors.transparent,
                    border: isPasswordCaps
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                  style: TextStyle(
                      color: isPasswordCaps ? kPrimaryColor : Colors.red),
                  "Contains at least 1 Uppercase letter")
            ],
          ),
          const SizedBox(
            height: defaultPadding / 2,
          ),
          Row(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: lowerCase ? Colors.green : Colors.transparent,
                    border: lowerCase
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                  style:
                      TextStyle(color: lowerCase ? kPrimaryColor : Colors.red),
                  "Contains at least 1 lowercase letter")
            ],
          ),
          const SizedBox(
            height: defaultPadding / 2,
          ),
          Row(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: hasNumeric ? Colors.green : Colors.transparent,
                    border: hasNumeric
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                  style:
                      TextStyle(color: hasNumeric ? kPrimaryColor : Colors.red),
                  "Contains at least 1 number")
            ],
          ),
          const SizedBox(
            height: defaultPadding / 2,
          ),
          Row(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: hasSpecialCase ? Colors.green : Colors.transparent,
                    border: hasSpecialCase
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                  style: TextStyle(
                      color: hasSpecialCase ? kPrimaryColor : Colors.red),
                  "Contains at least 1 Special Character")
            ],
          ),
          const SizedBox(
            height: defaultPadding / 2,
          ),
          Row(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: lengthCheck ? Colors.green : Colors.transparent,
                    border: lengthCheck
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                  style: TextStyle(
                      color: lengthCheck ? kPrimaryColor : Colors.red),
                  "Minimum of 8 characters")
            ],
          ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () async {
              setState(() {
                submitted = true;
              });
              if (formkey.currentState!.validate()) {
                if (await Signup(email_input.text, password_input.text)) {
                  print('signed up');
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                } else
                  print('signup failed');
              } else {
                print("incorrect input retype");
              }
              setState(() {
                submitted = false;
              });
            },
            child: Text("Sign Up".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

import 'package:NtuMarket/models/model_provider.dart';
import 'package:flutter/material.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Signup/signup_screen.dart';
import '../../home/home_screen.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  @override
  final password_input = TextEditingController();
  final confirm_password_input = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool _isVisible = false;
  bool _isVisible2 = false;
  bool isPasswordCaps = false;
  bool hasNumeric = false;
  bool lowerCase = false;
  bool hasSpecialCase = false;
  bool lengthCheck = false;

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
    return Form(
      key: formkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            controller: password_input,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onChanged: (password) => onPasswordChanged(password),
            obscureText: !_isVisible,
            onSaved: (email) {},
            validator: (value) {
              if (value!.isEmpty) {
                return "Password cannot be blank";
              } else if (!RegExp(
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                  .hasMatch(value!)) {
                return "Enter a valid password";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              hintText: "Enter New Password",
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
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          TextFormField(
            controller: confirm_password_input,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            obscureText: !_isVisible2,
            validator: (value) {
              if (value!.isEmpty) {
                return "Password cannot be blank";
              } else if (confirm_password_input.text != password_input.text) {
                return "Password does not match";
              } else if (!RegExp(
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                  .hasMatch(value!)) {
                return "Enter a valid password";
              } else {
                return null;
              }
            },
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isVisible2 = !_isVisible2;
                  });
                },
                icon: _isVisible
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off),
              ),
              hintText: "Confirm New Password",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
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
          const SizedBox(
            height: defaultPadding,
          ),
          Hero(
            tag: "changepassword_btn",
            child: ElevatedButton(
              onPressed: () async {
                if (formkey.currentState!.validate()) {
                  if (await ChangePassword(password_input.text)) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  } else {
                    print("change password failed");
                  }
                }
              },
              child: Text(
                "Change Password".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}

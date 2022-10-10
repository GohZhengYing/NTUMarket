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
            height: 30,
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

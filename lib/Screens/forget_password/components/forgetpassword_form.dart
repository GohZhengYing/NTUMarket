import 'package:NtuMarket/Screens/login/login_screen.dart';
import 'package:NtuMarket/data/model_provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Signup/signup_screen.dart';
import '../../change_password/change_password_screen.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({super.key});

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  @override
  final email_input = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
            cursorColor: kPrimaryColor,
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
            onSaved: (email) {},
            decoration: InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "forgetpassword_btn",
            child: ElevatedButton(
              onPressed: () async {
                if (await ForgetPassword(email_input.text)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen(); // If successful, users will be sent a new password in their email, so they will be prompted to sign in again with the new password
                      },
                    ),
                  );
                }
              },
              child: AutoSizeText(
                "Forget Password".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          GestureDetector(
            onTap: () {
              if (formkey.currentState!.validate()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              }
            },
            child: AutoSizeText(
              "Return to sign in",
              style: const TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}

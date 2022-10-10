import 'package:flutter/material.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../../models/model_provider.dart';
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
              obscureText: true,
              validator: (value) {
                if (!RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                    .hasMatch(value!)) {
                  return "Password Must Contain Minimum 1 Upper case,1 lowercase,1 Numeric Number,1 Special Character";
                } else if (value!.isEmpty) {
                  return "Password cannot be blank";
                } else {
                  return null;
                }
              },
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () async {
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

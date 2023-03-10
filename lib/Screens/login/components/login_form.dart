import 'package:flutter/material.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../../data/model_provider.dart';
import '../../Signup/signup_screen.dart';

import '../../forget_password/forget_password_screen.dart';
import '../../home/home_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  final email_input = TextEditingController();
  final password_input = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool _isVisible = false;
  bool submitted = false;
  bool login_failed = false;

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
          !login_failed? Text(""):Text("Login failed, invalid email or password",style: TextStyle(color: Colors.red)),
          TextFormField(
            autofillHints: [AutofillHints.email],
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: password_input,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textInputAction: TextInputAction.done,
              obscureText: !_isVisible,
              cursorColor: kPrimaryColor,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Password cannot be blank";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                hintText: "Your password",
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
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () async {

                setState(() {
                  submitted = true;
                });

                if (formkey.currentState!.validate()) {
                  if (await Login(email_input.text, password_input.text)) {
                    print('Logged in');
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  } else{
                    print('Login failed');}
                } else {

                  print("incorrect input");
                }
                setState(() {
                  login_failed = true;
                  submitted = false;
                });
              },
              child: Text(
                "Login".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ForgetPasswordScreen(); //forgetpassaword screen
                  },
                ),
              );
            },
            child: Text(
              "Forget Password",
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

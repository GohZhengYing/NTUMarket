import 'package:NtuMarket/Screens/login/login_screen.dart';
import 'package:NtuMarket/models/model_provider.dart';
import 'package:flutter/material.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Signup/signup_screen.dart';
import '../../change_password/change_password_screen.dart';

class ForgetPasswordForm extends StatelessWidget {
  ForgetPasswordForm({
    Key? key,
  }) : super(key: key);

  final email_input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: email_input,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
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
                if(await ForgetPassword(email_input.text)){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen(); // If successful, users will be sent a new password in their email, so they will be prompted to sign in again with the new password
                    },
                  ),
                );}
              },
              child: Text(
                "Forget Password".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          GestureDetector(
            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
            child: Text(
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

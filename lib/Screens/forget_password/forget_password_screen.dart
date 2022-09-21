import 'package:flutter/material.dart';


import '../../components/background.dart';
import '../../responsive.dart';
import '../Login/components//login_screen_top_image.dart';
import 'components/forgetpassword_form.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Background(
          child: SingleChildScrollView(
            child: Responsive(
              mobile: const MobileForgetPasswordScreen(),
              desktop: const MobileForgetPasswordScreen(),
            ),
          ),
        ),
      ),
    );
  }
}

class MobileForgetPasswordScreen extends StatelessWidget {
  const MobileForgetPasswordScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const LoginScreenTopImage(),
        const SizedBox(
          height: 50,
        ),
        Text("Find Your Account",
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(
          height: 10,
        ),
        Text("Enter your email address",
            style: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            )),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: ForgetPasswordForm(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}

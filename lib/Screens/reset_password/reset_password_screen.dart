
import 'package:flutter/material.dart';

import '../../responsive.dart';
import 'components/reset_password_form.dart';
import '../../components/background.dart';
import '../Login/components//login_screen_top_image.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const MobileResetPasswordScreen(),
          desktop: const MobileResetPasswordScreen(),
        ),
      ),
    );
  }
}

class MobileResetPasswordScreen extends StatelessWidget {
  const MobileResetPasswordScreen({
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
        Text("Choose a New Password",
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(
          height: 10,
        ),
        Text("Choose a New Password that is at least 6 characters long.",
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              fontWeight: FontWeight.w400,
            )),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: ResetPasswordForm(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}

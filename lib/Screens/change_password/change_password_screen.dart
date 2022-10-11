import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../components/background.dart';
import '../../responsive.dart';
import '../Login/components//login_screen_top_image.dart';
import 'components/change_password_form.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Background(
          child: SingleChildScrollView(
            child: Responsive(
              mobile: const MobileChangePasswordScreen(),
              desktop: const MobileChangePasswordScreen(),
            ),
          ),
        ),
      ),
    );
  }
}

class MobileChangePasswordScreen extends StatelessWidget {
  const MobileChangePasswordScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.cancel),
                color: Colors.black),
          ],
        ),
        const LoginScreenTopImage(),
        const SizedBox(
          height: 50,
        ),
        AutoSizeText("Choose a New Password",
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: ChangePasswordForm(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}

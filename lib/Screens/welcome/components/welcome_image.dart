import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "WELCOME TO NTUMARKET",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff171B5F),
            fontSize: 25,
          ),
        ),
        SizedBox(height: defaultPadding * 2),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: Container(
                child: Image.asset(
                  'assets/images/NTUWhite.png',
                  height: 300,
                  width: 200,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
        SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}

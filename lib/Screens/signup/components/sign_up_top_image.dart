import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class SignUpScreenTopImage extends StatelessWidget {
  const SignUpScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Signup Page",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Color(0xff171B5F)),
        ),
        SizedBox(height: defaultPadding),
        // Row(
        //   children: [
        //     const Spacer(),
        //     Expanded(
        //       flex: 8,
        //       child: Container(
        //         child: Image.asset(
        //           'assets/images/NTUWhite.png',
        //           height: 100,
        //           width: 200,
        //         ),
        //       ),
        //     ),
        //     const Spacer(),
        //   ],
        // ),
        SizedBox(height: defaultPadding),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants.dart';

class ViewPostAsBuyerEmailImage extends StatelessWidget {
  const ViewPostAsBuyerEmailImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: Image(image: AssetImage('assets/images/NTUPaper.jpg'),height: 350,),
            ),
            Spacer(),
          ],
        ),
        SizedBox(height: 25,),
        Text(
          "NTU Paper",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: kPrimaryColor,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants.dart';

class CreatePostImage extends StatelessWidget {
  const CreatePostImage({
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
              child: Image(image: AssetImage('assets/images/NTUPaper.jpg'),height: 200,),
            ),
            Spacer(),
          ],
        ),

      ],
    );
  }
}

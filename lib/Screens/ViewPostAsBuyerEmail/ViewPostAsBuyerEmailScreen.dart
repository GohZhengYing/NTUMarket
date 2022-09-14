import 'package:cz3002app/Screens/EditPost/component/EditPostForm.dart';
import 'package:cz3002app/Screens/EditPost/component/EditPostImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';

import 'component/colordot.dart';
import 'component/ViewPostAsBuyerEmailForm.dart';
import 'component/ViewPostAsBuyerEmailImage.dart';
import '../ViewPostAsBuyer/component/Product.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

class ViewPostAsBuyerEmailScreen extends StatelessWidget {
  const ViewPostAsBuyerEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                "assets/images/Dora.jpg",
                height: 20,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const ViewPostAsBuyerEmailImage(),
          const SizedBox(height:20),
          Row(
              children:const [
                Spacer(),
                Expanded (
                  flex: 8,
                  child: ViewPostAsBuyerEmailForm(),
                ),
                Spacer(),
              ]
          ),
        ],
      ),
    );
  }
}

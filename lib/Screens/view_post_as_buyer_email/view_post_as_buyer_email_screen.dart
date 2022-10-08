
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';

import '../../models/post.dart';
import 'component/colordot.dart';
import 'component/view_post_as_buyer_email_form.dart';
import 'component/view_post_as_buyer_email_image.dart';

import 'package:flutter/material.dart';
import '../../constants.dart';

class ViewPostAsBuyerEmailScreen extends StatelessWidget {
  Post post;
  ViewPostAsBuyerEmailScreen({Key? key,required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(onPressed:() {Navigator.pop(context);}, icon: Icon(Icons.keyboard_arrow_left),color: Colors.black,iconSize: 40),
            actions: [
              // IconButton(
              //   onPressed: () {},
              //   icon: CircleAvatar(
              //     backgroundColor: Colors.white,
              //     child: Image.asset(
              //       "assets/images/Dora.jpg",
              //       height: 20,
              //     ),
              //   ),
              // ),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.memory( Base64Decoder().convert(post.image),height: 200),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ViewPostAsBuyerEmailForm(),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

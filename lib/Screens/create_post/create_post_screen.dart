
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';


import '../Favourites/favourites_screen.dart';

import 'package:flutter/material.dart';
import '../../constants.dart';
import '../home/home_screen.dart';
import 'component/create_post_form.dart';
import 'component/create_post_image.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(onPressed:() {Navigator.pop(context);}, icon: Icon(Icons.cancel),color: Colors.black),
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
              const CreatePostImage(),
              const SizedBox(height:20),
              Row(
                  children:const [
                    Spacer(),
                    Expanded (
                      flex: 8,
                      child: CreatePostForm(),
                    ),
                    Spacer(),
                  ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}

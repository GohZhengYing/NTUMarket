
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';
import '../../models/model_provider.dart';
import '../../models/post.dart';
import '../edit_post/edit_post_screen.dart';
import 'component/ProductOwner.dart';

import 'component/colordot.dart';

class ViewPostAsOwnerScreen extends StatelessWidget {
  const ViewPostAsOwnerScreen({Key? key, required this.post})
      : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: false,
          backgroundColor: const Color(0xFFFEFBF9),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(onPressed:() {Navigator.pop(context);}, icon: Icon(Icons.keyboard_arrow_left),color: Colors.black,iconSize: 40),
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
            children: [
              Image.memory( Base64Decoder().convert(post.image),height: 200),
              const SizedBox(height: defaultPadding * 1.5),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(defaultPadding,
                      defaultPadding * 2, defaultPadding, defaultPadding),
                  decoration: const BoxDecoration(
                    color: kPrimaryLightColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(defaultBorderRadius * 3),
                      topRight: Radius.circular(defaultBorderRadius * 3),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              post.title,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          const SizedBox(width: defaultPadding),
                          Text(
                            "\$" + post.price.toString(),
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: defaultPadding),
                        child: Text(
                          post.description,
                        ),
                      ),
                      // Text(
                      //   "Colors",
                      //   style: Theme.of(context).textTheme.subtitle2,
                      // ),
                      // const SizedBox(height: defaultPadding / 2),
                      // Row(
                      //   children: const [
                      //     const Spacer(),
                      //     ColorDot(
                      //       color: Color.fromARGB(255, 10, 122, 6),
                      //       isActive: false,
                      //     ),
                      //     ColorDot(
                      //       color: Color(0xFF141B4A),
                      //       isActive: true,
                      //     ),
                      //     ColorDot(
                      //       color: Color(0xFFF4E5C3),
                      //       isActive: false,
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(height: defaultPadding * 2),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 150,
                              height: 60,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => EditPostScreen(post:post))
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: kPrimaryColor,
                                    shape: const StadiumBorder()),
                                child: const Text("Edit"),
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              height: 60,
                              child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                      context: context
                                      , builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Warning'),           // To display the title it is optional
                                          content: Text('Are you sure?'),   // Message which will be pop up on the screen
                                          // Action widget which will provide the user to acknowledge the choice
                                          actions: [
                                            TextButton(
                                              onPressed: () async {
                                                if(await DeletePost(post.id)){
                                                print('deleted post');
                                                Navigator.pop(context);
                                                Navigator.pop(context,'refresh');
                                                }
                                                else
                                                print('delete failed');
                                              },
                                              child: Text('Yes'),
                                            ),
                                            TextButton(                     // FlatButton widget is used to make a text to work like a button
                                              onPressed: () {
                                                Navigator.pop(context,'refresh');
                                              },             // function used to perform after pressing the button
                                              child: Text('No'),
                                            ),
                                          ],
                                        );
                                  });

                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: kPrimaryColor,
                                    shape: const StadiumBorder()),
                                child: const Text("Delete"),
                              ),
                            ),
                          ],
                        ),

                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

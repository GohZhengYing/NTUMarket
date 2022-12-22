
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';
import '../../data/model_provider.dart';
import '../../models/post.dart';
import '../edit_post/edit_post_screen.dart';
import 'component/ProductOwner.dart';

import 'component/colordot.dart';

class ViewPostAsOwnerScreen extends StatefulWidget {
  final Post post;
  const ViewPostAsOwnerScreen({Key? key, required this.post})
      : super(key: key);

  @override
  _ViewPostAsOwnerScreenState createState() => _ViewPostAsOwnerScreenState();
}

class _ViewPostAsOwnerScreenState extends State<ViewPostAsOwnerScreen> {


  static const snackBar = SnackBar(
    content: Text('Smoething went wrong, try again later'),
  );

  bool submitted = false;

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

            ],
          ),
          body: Column(
            children: [
              Image.memory( Base64Decoder().convert(widget.post.image),height: 200),
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
                              widget.post.title,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          const SizedBox(width: defaultPadding),
                          Text(
                            "\$" + widget.post.price.toString(),
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: defaultPadding),
                        child: Text(
                          widget.post.description,
                        ),
                      ),
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
                                    MaterialPageRoute(builder: (context) => EditPostScreen(post:widget.post))
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
                                                // if(submitted){
                                                //   return Container(
                                                //     child: Center(
                                                //       child: SizedBox(height: 50.0,
                                                //         width:50.0,
                                                //         child: CircularProgressIndicator(),
                                                //       ),
                                                //     ),
                                                //     color: Colors.white,
                                                //
                                                //   );
                                                // }
                                                showDialog(
                                                context: context
                                                , builder: (BuildContext context) {
                                                    return Container(
                                                      child: Center(
                                                        child: SizedBox(height: 50.0,
                                                          width:50.0,
                                                          child: CircularProgressIndicator(),
                                                        ),
                                                      ),
                                                      color: Colors.white,

                                                    );
                                                }
                                                );
                                                if(await DeletePost(widget.post.id)){
                                                print('deleted post');
                                                Navigator.pop(context,'refresh');
                                                Navigator.pop(context,'refresh');
                                                Navigator.pop(context,'refresh');
                                                }
                                                else
                                                  {Navigator.pop(context,'refresh');
                                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                print('delete failed');}
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

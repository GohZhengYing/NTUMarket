
import 'dart:convert';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/post.dart';
import '../../view_post_as_owner/component/ProductOwner.dart';
import '../../view_post_as_owner/view_post_as_owner_screen.dart';



class HomeMyPosts extends StatefulWidget {



  HomeMyPosts({super.key,required this.posts,required this.LoadPosts});
  List<Post> posts;
  Function LoadPosts;

  @override
  State<HomeMyPosts> createState() => _HomeMyPostsState();
}

class _HomeMyPostsState extends State<HomeMyPosts> {


  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        Padding(
            padding:EdgeInsets.fromLTRB(0, 30, 0, 10),
            child: SizedBox(
                width: MediaQuery.of(context).size.width *0.867,
                child:Text('My Posts',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      fontFamily: 'Roboto',
                      fontSize: 17
                  ),)
            )
        ),
        Wrap(
          spacing: MediaQuery.of(context).size.width *0.0667, // gap between adjacent chips
          runSpacing: 20.0, // gap between lines
          children: <Widget>[
            for (var post in widget.posts)
            SizedBox(
              width: MediaQuery.of(context).size.width *0.4,
              child: GestureDetector(
                onTap: () async {

                  String refresh = await Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ViewPostAsOwnerScreen(post: post,))
                  );
                  if(refresh == 'refresh'){
                    widget.LoadPosts();
                  }
                },
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width *0.3,
                      height: MediaQuery.of(context).size.width *0.4,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF61E4D5),
                            border: Border.all(
                                width: 1,
                                color: Color(0xFF61E4D5)
                            )
                        ),
                        child: Image.memory( Base64Decoder().convert(post.image)),
                      ),
                    ),
                    Text(post.title),
                    Text('${post.category} \$${post.price}'),
                    Text(' '),
                  ],
                ),
              ),
            ),
          ],
        ),
        // widget.posts.length != 0?ElevatedButton(
        //   onPressed: null,
        //   child: Text('Show More'),
        //   style: ElevatedButton.styleFrom(
        //       textStyle: const TextStyle(fontSize: 20),
        //       minimumSize: Size(MediaQuery.of(context).size.width *0.867,40),
        //       maximumSize: Size(MediaQuery.of(context).size.width *0.867,40),
        //       backgroundColor: Color(0xFF61E4D5),
        //       disabledBackgroundColor: Color(0xFF61E4D5)
        //   ),
        // ):Container(),
      ],
    );
  }
}
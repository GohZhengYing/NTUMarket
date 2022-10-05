import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../models/post.dart';
import '../../view_post_as_owner/component/ProductOwner.dart';
import '../../view_post_as_owner/view_post_as_owner_screen.dart';

class ViewUserProfileRecentlyUploadedList extends StatefulWidget {
  const ViewUserProfileRecentlyUploadedList({super.key});

  @override
  State<ViewUserProfileRecentlyUploadedList> createState() => _ViewUserProfileRecentlyUploadedListState();
}

class _ViewUserProfileRecentlyUploadedListState extends State<ViewUserProfileRecentlyUploadedList> {

  List<Post> posts = [];

  @override
  Future<void> LoadPosts() async {
    super.initState();
    final PostStorage postStorage = new PostStorage();
    List<Post>_posts = await postStorage.readPost();
    setState(() {
      print(posts);
      posts = _posts;
    });


  }
  // This widget is the root of your application.

  @override
  void initState() {
    super.initState();
    LoadPosts();

  }

  @override
  Widget build(BuildContext context) {
    final TextStyle FavouritesStyle =
    TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      fontSize: 17,
      color: Colors.black,

    );

    return Column(
      children: [
        Padding(
            padding:EdgeInsets.fromLTRB(0, 30, 0, 10),
            child: SizedBox(
                width: MediaQuery.of(context).size.width *0.867,
                child:Text('Recently Uploaded',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      fontFamily: 'Roboto',
                      fontSize: 25
                  ),)
            )
        ),
        Wrap(
          spacing: MediaQuery.of(context).size.width *0.0667, // gap between adjacent chips
          runSpacing: 20.0, // gap between lines
          children: <Widget>[
            for (var post in posts)
            SizedBox(
              width: MediaQuery.of(context).size.width *0.4,
              child: GestureDetector(
                  onTap: () {
                  Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ViewPostAsOwnerScreen(post: post,))
                  );
                  },

                  child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: SizedBox(
                            width: MediaQuery.of(context).size.width *0.32,
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

                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(post.title,
                        style: FavouritesStyle,),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('${post.category} \$${post.price}',
                        style: FavouritesStyle,),
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width *0.4,
            //   child: Column(
            //     children: [
            //       Padding(
            //         padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            //         child: SizedBox(
            //           width: MediaQuery.of(context).size.width *0.32,
            //           height: MediaQuery.of(context).size.width *0.4,
            //           child: Container(
            //             decoration: BoxDecoration(
            //                 border: Border.all(
            //                     width: 5,
            //                     color: Color(0xFF0B20DE)
            //                 )
            //             ),
            //             child: Image.asset('assets/images/NTUMarketLogo.png'),
            //           ),
            //         ),
            //
            //       ),
            //       Align(
            //         alignment: Alignment.centerLeft,
            //         child: Text('EE4758 Exam',
            //           style: FavouritesStyle,),
            //       ),
            //       Align(
            //         alignment: Alignment.centerLeft,
            //         child: Text('Paper \$40',
            //           style: FavouritesStyle,),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width *0.4,
            //   child: Column(
            //     children: [
            //       Padding(
            //         padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            //         child: SizedBox(
            //           width: MediaQuery.of(context).size.width *0.32,
            //           height: MediaQuery.of(context).size.width *0.4,
            //           child: Container(
            //             decoration: BoxDecoration(
            //                 border: Border.all(
            //                     width: 5,
            //                     color: Color(0xFF0B20DE)
            //                 )
            //             ),
            //             child: Image.asset('assets/images/NTUMarketLogo.png'),
            //           ),
            //         ),
            //
            //       ),
            //       Align(
            //         alignment: Alignment.centerLeft,
            //         child: Text('EE4758 Exam',
            //           style: FavouritesStyle,),
            //       ),
            //       Align(
            //         alignment: Alignment.centerLeft,
            //         child: Text('Paper \$40',
            //           style: FavouritesStyle,),
            //       ),
            //     ],
            //   ),
            // ),

          ],
        ),

      ],
    );
  }
}
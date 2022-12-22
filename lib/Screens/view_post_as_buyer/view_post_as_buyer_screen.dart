import 'dart:convert';

import 'package:NtuMarket/data/model_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';
import '../../models/post.dart';
import '../../models/user.dart';
import '../view_post_as_buyer_email/view_post_as_buyer_email_screen.dart';
import 'component/Product.dart';

import 'component/colordot.dart';

class ViewPostAsBuyerScreen extends StatefulWidget {
  ViewPostAsBuyerScreen({Key? key, required this.post})
      : super(key: key);

  final Post post;

  @override
  _ViewPostAsBuyerScreenState createState() => _ViewPostAsBuyerScreenState();
}

class _ViewPostAsBuyerScreenState extends State<ViewPostAsBuyerScreen> {

  User user = new User(email: '', token: '', image: '', favourite_id: []);

  MaterialColor fav = Colors.grey ;

  Future<void> LoadUser() async {
    final UserStorage userStorage = new UserStorage();
    User _user = User.fromJson(await userStorage.readUser());
    setState(() {
      if(_user.favourite_id.contains(widget.post.id)){
        fav = Colors.yellow;
      }
      user = _user;
    });
  }

  // This widget is the root of your application.

  void initState(){
    LoadUser();
  }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async => false,
      child: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: false,
          backgroundColor: const Color(0xFFFEFBF9),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(onPressed:() {Navigator.pop(context,'refresh');}, icon: Icon(Icons.keyboard_arrow_left),color: Colors.black,iconSize: 40),
            actions: [
              IconButton(
                onPressed: () async {
                  if(fav==Colors.yellow){
                    if(await DeleteFavourites(widget.post.id)){
                      setState(() {
                        fav = Colors.grey;
                      });
                    };
                  }
                  else{
                    if(await AddFavourites(widget.post.id)){
                    setState(() {
                      fav = Colors.yellow;
                    });
                    }
                  }
                },
                icon: Icon(Icons.star,color: fav),
              ),
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
                        child: SizedBox(
                          width: 200,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => ViewPostAsBuyerEmailScreen(post: widget.post,))
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryColor,
                                shape: const StadiumBorder()),
                            child: const Text("Email Me"),
                          ),
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

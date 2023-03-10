
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';

import '../../data/model_provider.dart';
import '../../models/post.dart';
import 'component/colordot.dart';
import 'component/view_post_as_buyer_email_form.dart';
import 'component/view_post_as_buyer_email_image.dart';

import 'package:flutter/material.dart';
import '../../constants.dart';

class ViewPostAsBuyerEmailScreen extends StatefulWidget {

  Post post;
  ViewPostAsBuyerEmailScreen({Key? key, required this.post}) : super(key: key);

  @override
  _ViewPostAsBuyerEmailScreenState createState() => _ViewPostAsBuyerEmailScreenState();
}

class _ViewPostAsBuyerEmailScreenState extends State<ViewPostAsBuyerEmailScreen> {

  String email = '';
  bool submitted = true;

  static const snackBar = SnackBar(
    content: Text('Copied to clipboard'),
  );


  @override
  Future<void> fetch() async {
    super.initState();
    String _email = await FetchEmail(widget.post.id);
    setState(() {
      submitted = false;
      email = _email;
    });


  }
  // This widget is the root of your application.

  void initState(){
    super.initState();
    fetch();
  }

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
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.memory( Base64Decoder().convert(widget.post.image),height: 200),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                      height:  MediaQuery.of(context).size.height*0.5,
                      color: Color(0xFF78E5D6),
                      child: Center(
                          child:
                          submitted ? Container(
                            child: Center(
                              child: SizedBox(height: 50.0,
                                width:50.0,
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            color: Colors.white,

                          ):TextButton(onPressed: () async {
                            await Clipboard.setData(ClipboardData(text: email));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            // copied successfully
                          }, child: Text("Email: "+email,style: Theme.of(context).textTheme.headline6,)))),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: ViewPostAsBuyerEmailForm(),
                // ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

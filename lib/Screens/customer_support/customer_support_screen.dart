import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../models/post.dart';


class CustomerSupportScreen extends StatelessWidget {
  CustomerSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(onPressed:() {Navigator.pop(context);}, icon: Icon(Icons.keyboard_arrow_left),color: Colors.black,iconSize: 40),
              shadowColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 100,
              backgroundColor: Color(0xFF61E4D5),
              flexibleSpace: Image(
                  image:AssetImage('assets/images/NTUMarketLogo.png'),
                  fit:BoxFit.cover)
              ,
              centerTitle: true,
            ),
            body: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints viewportConstraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: viewportConstraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child:Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding:EdgeInsets.fromLTRB(0, 30, 0, 10),
                                  child: SizedBox(
                                      width: MediaQuery.of(context).size.width *0.867,
                                      child:Text('FAQ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            decoration: TextDecoration.underline,
                                            fontFamily: 'Roboto',
                                            fontSize: 25
                                        ),)
                                  )
                              ),
                              Text('Qn: How do I favourite a post?',style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontFamily: 'Roboto',
                                  fontSize: 15
                              ),),
                              Text('Ans: You can favourite a post by clicking on the favourite button on the top right corner of a post\n'),

                              Text('Qn: How do I change my password?',style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontFamily: 'Roboto',
                                  fontSize: 15
                              )),
                              Text('Ans: Navigate to Settings -> Edit Profile -> Change Password\n'),

                              Text('Qn: How do we receive payment?',style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontFamily: 'Roboto',
                                  fontSize: 15
                              )),
                              Text('Ans: We do not handle transactions in our app. All transactions will happen offline, based on arrangements between the buyer and the seller.\n'),

                              Text('Qn: Am I allowed to sell slides released in the past?',style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontFamily: 'Roboto',
                                  fontSize: 15
                              )),
                              Text('Ans: No. As these materials are copyrighted, please refrain from selling them as it is not legal to do so\n'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

        ),
      ),
    );
  }
}


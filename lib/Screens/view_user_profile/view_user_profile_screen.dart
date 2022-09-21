import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../settings/settings_screen.dart';
import 'components/view_user_profile_recently_uploaded_list.dart';




class ViewUserProfileScreen extends StatefulWidget {
  const ViewUserProfileScreen({super.key});

  @override
  State<ViewUserProfileScreen> createState() => _ViewUserProfileScreenState();
}

class _ViewUserProfileScreenState extends State<ViewUserProfileScreen> {


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(onPressed:() {Navigator.pop(context);}, icon: Icon(Icons.keyboard_arrow_left),color: Colors.black,iconSize: 40),
            title: Column(
              children: [
                IconButton(
                  icon: Icon(Icons.account_circle,
                      color: Colors.black,
                      size: 50),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                ),
                Text('User1',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    fontFamily: 'Roboto',
                ),),
              ],
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.settings,
                    color: Colors.black,
                    size: 30), onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SettingsScreen())
                  );
              },
              )
            ],
            shadowColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 100,
            backgroundColor: Color(0xFF61E4D5),
            flexibleSpace: Image(
                image:AssetImage('assets/images/NTUMarketLogoTopLeft.png'),
                fit:BoxFit.cover)
            ,
            leadingWidth: MediaQuery.of(context).size.width *0.3,
            centerTitle: true,
          ),
          backgroundColor: Colors.white,
          body:  LayoutBuilder(
            builder: (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child:Center(
                      child: Column(
                        children: <Widget>[
                          ViewUserProfileRecentlyUploadedList()
                        ],
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
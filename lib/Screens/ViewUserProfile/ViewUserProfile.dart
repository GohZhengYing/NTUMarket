import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cz3002app/Screens/ViewUserProfile/components/ViewUserProfileMainSection.dart';



class ViewUserProfileScreen extends StatefulWidget {
  const ViewUserProfileScreen({super.key});

  @override
  State<ViewUserProfileScreen> createState() => _ViewUserProfileScreenState();
}

class _ViewUserProfileScreenState extends State<ViewUserProfileScreen> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
                  size: 30), onPressed: () {},
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
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,
            color: Colors.black,
            size: 30), onPressed: () {},
          ),
          leadingWidth: MediaQuery.of(context).size.width *0.3,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomAppBar(
            color: Color(0xFF61E4D5),
            child: IconTheme(
              data: IconThemeData(color:Colors.black),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    tooltip: 'Navigate to home page',
                    icon: const Icon(Icons.home_rounded),
                    onPressed: () {},
                  ),
                  IconButton(
                    tooltip: 'Add post',
                    icon: const Icon(Icons.post_add),
                    onPressed: () {},
                  ),
                  IconButton(
                    tooltip: 'favourites',
                    icon: const Icon(Icons.star),
                    onPressed: () {},
                  ),
                  IconButton(
                    tooltip: 'contact',
                    icon: const Icon(Icons.account_circle),
                    onPressed: () {},
                  ),
                ],
              ),
            )

        ),
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
                        ViewUserProfileMainSection()
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
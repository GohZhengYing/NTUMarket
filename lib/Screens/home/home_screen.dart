import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



import '../Favourites/favourites_screen.dart';
import '../create_post/create_post_screen.dart';
import '../view_user_profile/view_user_profile_screen.dart';
import 'components/home_categories.dart';
import 'components/home_recently_uploaded.dart';
import 'components/home_search_bar.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
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
          backgroundColor: Colors.white,
          bottomNavigationBar: BottomAppBar(
              color: Color(0xFF61E4D5),
              child: IconTheme(
                data: IconThemeData(color:Colors.black),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    // IconButton(
                    //   disabledColor: Colors.white,
                    //   tooltip: 'Navigate to home page',
                    //   icon: const Icon(Icons.home_rounded),
                    //   onPressed: null,
                    // ),
                    IconButton(
                      tooltip: 'Add post',
                      icon: const Icon(Icons.post_add),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CreatePostScreen(),
                            )
                        );
                      },
                    ),
                    IconButton(
                      tooltip: 'favourites',
                      icon: const Icon(Icons.star),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => FavouritesScreen(),
                            )
                        );
                      },
                    ),
                    IconButton(
                      tooltip: 'contact',
                      icon: const Icon(Icons.account_circle),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ViewUserProfileScreen(),
                            )
                        );
                      },
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
                              HomeSearchBar(),
                              HomeCategories(),
                              HomeRecentlyUsed()
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

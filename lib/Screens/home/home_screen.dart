import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



import '../../models/post.dart';
import '../Favourites/favourites_screen.dart';
import '../advanced_search/advanced_search_screen.dart';
import '../create_post/create_post_screen.dart';
import '../settings/settings_screen.dart';
import '../view_user_profile/view_user_profile_screen.dart';
import 'components/home_categories.dart';
import 'components/home_my_posts.dart';
import 'components/home_search_bar.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late GlobalKey<ScaffoldState> _scaffoldKey;


  List<Post> posts = [];
  bool loaded = false;
  int times =0;
  String err = "";



  @override
  Future<void> LoadPosts() async {
    try{
      final PostStorage postStorage = new PostStorage();
      List<Post>_posts = await postStorage.readPost();
      setState(() {
        loaded = true;
        posts = _posts;
      });
    }
    catch(e){
      LoadPosts();
      // setState(() {
      //   times = -1;
      //   err = e.toString();
      // });

    }



  }
  // This widget is the root of your application.

  void initState(){
    LoadPosts();
  }

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
                    IconButton(
                      tooltip: 'Add post',
                      icon: const Icon(Icons.post_add),
                      onPressed: () async {

                        String refresh = await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CreatePostScreen(),
                            )
                        );
                        //     .then((_) => setState(() {
                        //   LoadPosts();
                        // }));
                        print(refresh);
                        if(refresh == 'refresh'){
                          LoadPosts();
                        }



                      },
                    ),
                    IconButton(
                      tooltip: 'search',
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AdvancedSearchScreen(),
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
                      tooltip: 'settings',
                      icon: const Icon(Icons.settings),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SettingsScreen(),
                            )
                        );
                      },
                    ),
                  ],
                ),
              )

          ),
          body:  RefreshIndicator(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints viewportConstraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height,
                    ),
                    child: IntrinsicHeight(
                      child:Center(
                        child: Column(
                          children: <Widget>[
                            //HomeSearchBar(),
                            //HomeCategories(),
                            HomeMyPosts(posts:posts,LoadPosts: LoadPosts)
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            onRefresh: (){
    return Future.delayed(
    Duration(seconds: 1),
    () async {
    /// adding elements in list after [1 seconds] delay
    /// to mimic network call
    ///
    /// Remember: [setState] is necessary so that
    /// build method will run again otherwise
    /// list will not show all elements
      final PostStorage postStorage = new PostStorage();
      List<Post>_posts = await postStorage.readPost();
      setState(() {
        posts = _posts;
      });

    // showing snackbar

    });
            },
          ),
        ),
      ),
    );
  }
}

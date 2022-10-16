import 'package:NtuMarket/models/model_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../models/post.dart';
import 'components/favourites_list.dart';



class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {

  late GlobalKey<ScaffoldState> _scaffoldKey;

  bool submitted = true;
  bool refresh = false;
  List<Post> posts = [];

  void ref(){
    LoadPosts();
}

  @override
  Future<void> LoadPosts() async {
    super.initState();
    List<Post>_posts = await FetchFavourites();
    setState(() {
      posts = _posts;
      submitted = false;
    });


  }
  // This widget is the root of your application.

  void initState(){
    _scaffoldKey = GlobalKey();
    super.initState();
    LoadPosts();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
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
          backgroundColor: Colors.white,
          body:  LayoutBuilder(
            builder: (BuildContext context, BoxConstraints viewportConstraints) {
              if(submitted){
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
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child:Center(
                      child: Column(
                        children: <Widget>[

                          FavouritesList(posts: posts, ref: ref,),
                          refresh? Container():Container()
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

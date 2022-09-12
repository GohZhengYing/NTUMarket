import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cz3002app/Screens/Favourites/components/FavouritesMainSection.dart';



class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
                        FavouritesMainSection()
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

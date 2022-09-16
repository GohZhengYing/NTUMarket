import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FavouritesList extends StatefulWidget {
  const FavouritesList({super.key});

  @override
  State<FavouritesList> createState() => _FavouritesListState();
}

class _FavouritesListState extends State<FavouritesList> {

  @override
  Widget build(BuildContext context) {
    final TextStyle FavouritesStyle =
    TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'Roboto',
        fontSize: 17,
        color: Color(0xFF0B20DE),

    );

    return Column(
      children: [
        Padding(
            padding:EdgeInsets.fromLTRB(0, 30, 0, 10),
            child: SizedBox(
                width: MediaQuery.of(context).size.width *0.867,
                child:Text('Favourites',
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
            SizedBox(
              width: MediaQuery.of(context).size.width *0.4,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width *0.32,
                          height: MediaQuery.of(context).size.width *0.4,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 5,
                                    color: Color(0xFF0B20DE)
                                )
                            ),
                            child: Image.asset('assets/images/NTUMarketLogo.png'),
                          ),
                        ),
                        IconButton(onPressed: null, icon: Icon(Icons.clear,
                          weight: 10,),
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),)
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('EE4758 Exam',
                      style: FavouritesStyle,),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Paper \$40',
                      style: FavouritesStyle,),
                  ),
                  Text(' '),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('User1',
                      style: FavouritesStyle,),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width *0.4,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width *0.32,
                          height: MediaQuery.of(context).size.width *0.4,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 5,
                                    color: Color(0xFF0B20DE)
                                )
                            ),
                            child: Image.asset('assets/images/NTUMarketLogo.png'),
                          ),
                        ),
                        IconButton(onPressed: null, icon: Icon(Icons.clear,
                          weight: 10,),
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),)
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('EE4758 Exam',
                      style: FavouritesStyle,),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Paper \$40',
                      style: FavouritesStyle,),
                  ),
                  Text(' '),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('User1',
                      style: FavouritesStyle,),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width *0.4,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width *0.32,
                          height: MediaQuery.of(context).size.width *0.4,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 5,
                                    color: Color(0xFF0B20DE)
                                )
                            ),
                            child: Image.asset('assets/images/NTUMarketLogo.png'),
                          ),
                        ),
                        IconButton(onPressed: null, icon: Icon(Icons.clear,
                          weight: 10,),
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),)
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('EE4758 Exam',
                      style: FavouritesStyle,),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Paper \$40',
                      style: FavouritesStyle,),
                  ),
                  Text(' '),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('User1',
                      style: FavouritesStyle,),
                  ),
                ],
              ),
            ),

          ],
        ),

      ],
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ViewUserProfileMainSection extends StatefulWidget {
  const ViewUserProfileMainSection({super.key});

  @override
  State<ViewUserProfileMainSection> createState() => _ViewUserProfileMainSectionState();
}

class _ViewUserProfileMainSectionState extends State<ViewUserProfileMainSection> {

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
                child:Text('Recently Uploaded',
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
                    child: SizedBox(
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
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width *0.4,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: SizedBox(
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
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width *0.4,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: SizedBox(
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
                ],
              ),
            ),

          ],
        ),

      ],
    );
  }
}
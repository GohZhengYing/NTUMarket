import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPAgeRecentlyUsed extends StatefulWidget {
  const MainPAgeRecentlyUsed({super.key});

  @override
  State<MainPAgeRecentlyUsed> createState() => _MainPAgeRecentlyUsedState();
}

class _MainPAgeRecentlyUsedState extends State<MainPAgeRecentlyUsed> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding:EdgeInsets.fromLTRB(0, 30, 0, 10),
            child: SizedBox(
                width: MediaQuery.of(context).size.width *0.867,
                child:Text('Recently Used',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      fontFamily: 'Roboto',
                      fontSize: 17
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width *0.3,
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
                  Text('EE4758'),
                  Text('Paper \$40'),
                  Text(' '),
                  Text('User1')
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width *0.4,
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width *0.3,
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
                  Text('EE4758'),
                  Text('Paper \$40'),
                  Text(' '),
                  Text('User1')
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width *0.4,
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width *0.3,
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
                  Text('EE4758'),
                  Text('Paper \$40'),
                  Text(' '),
                  Text('User1')
                ],
              ),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: null,
          child: Text('Show More'),
          style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
              minimumSize: Size(MediaQuery.of(context).size.width *0.867,40),
              maximumSize: Size(MediaQuery.of(context).size.width *0.867,40),
              backgroundColor: Color(0xFF61E4D5),
              disabledBackgroundColor: Color(0xFF61E4D5)
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../view_post_as_buyer/component/Product.dart';
import '../../view_post_as_buyer/view_post_as_buyer_screen.dart';




class SearchResultsResultsList extends StatefulWidget {
  const SearchResultsResultsList({Key? key}) : super(key: key);

  @override
  _SearchResultsResultsListState createState() => _SearchResultsResultsListState();
}

class _SearchResultsResultsListState extends State<SearchResultsResultsList> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child:         Wrap(
        spacing: MediaQuery.of(context).size.width *0.0667, // gap between adjacent chips
        runSpacing: 20.0, // gap between lines
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ViewPostAsBuyerScreen(product: demo_product[0]))
              );
            },
            child: SizedBox(
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
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ViewPostAsBuyerScreen(product: demo_product[0]))
              );
            },
            child: SizedBox(
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
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ViewPostAsBuyerScreen(product: demo_product[0]))
              );
            },
            child: SizedBox(
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
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ViewPostAsBuyerScreen(product: demo_product[0]))
              );
            },
            child: SizedBox(
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
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ViewPostAsBuyerScreen(product: demo_product[0]))
              );
            },
            child: SizedBox(
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
          ),
        ],
      ),
    );
  }
}

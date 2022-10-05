
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../advanced_search/advanced_search_screen.dart';

class HomeCategories extends StatefulWidget {
  const HomeCategories({super.key});

  @override
  State<HomeCategories> createState() => _HomeCategoriesState();
}

class _HomeCategoriesState extends State<HomeCategories> {

  @override
  Widget build(BuildContext context) {
    final ButtonStyle CategoriesStyle =
    ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 13),
        minimumSize: Size(MediaQuery.of(context).size.width *0.4,40),
        maximumSize: Size(MediaQuery.of(context).size.width *0.4,40),
        backgroundColor: Color(0xFF61E4D5),
        disabledBackgroundColor: Color(0xFF61E4D5)
    );

    return Column(
      children: [
//         Padding(
//           padding:EdgeInsets.fromLTRB(0, 30, 0, 10),
//           child: SizedBox(
//               width: MediaQuery.of(context).size.width *0.867,
//               child:Text('Categories',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 decoration: TextDecoration.underline,
//                 fontFamily: 'Roboto',
//                 fontSize: 17
//               ),)
//           )
//         )
// ,
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     Column(
        //       children: [
        //         ElevatedButton(
        //           onPressed: null,
        //           child: Padding(
        //             padding: const EdgeInsets.all(2.0),
        //             child: Text('Exam Papers'),
        //           ),
        //           style: CategoriesStyle,
        //         ),
        //         ElevatedButton(
        //           onPressed: null,
        //           child: Padding(
        //             padding: const EdgeInsets.all(2.0),
        //             child: Text('Lecture Notes'),
        //           ),
        //           style: CategoriesStyle,
        //         ),
        //       ],
        //     ),
        //     Column(
        //       children: [
        //         ElevatedButton(
        //           onPressed: null,
        //           child: Padding(
        //             padding: const EdgeInsets.all(2.0),
        //             child: Text('Stationaries'),
        //           ),
        //           style: CategoriesStyle,
        //         ),
        //         ElevatedButton(
        //           onPressed: null,
        //           child: Padding(
        //             padding: const EdgeInsets.all(2.0),
        //             child: Text('Hardware'),
        //           ),
        //           style: CategoriesStyle,
        //         ),
        //       ],
        //     )
        //   ],
        // ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20,0, 20, 0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AdvancedSearchScreen())
              );
            },
            child: Text('Search Posts'),
            style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
                minimumSize: Size(MediaQuery.of(context).size.width *0.867,40),
                maximumSize: Size(MediaQuery.of(context).size.width *0.867,40),
                backgroundColor: Color(0xFF61E4D5),
                disabledBackgroundColor: Color(0xFF61E4D5)
            ),
          ),
        ),
      ],
    );
  }
}
import 'dart:math';

import 'package:flutter/material.dart';
import 'loginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      title: 'Landing Page',
      home: LoginScreen(),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//         body: Center(
//       child: Container(
//         height: 800, width: 300, color: Colors.blue,
//         child: Stack(children: <Widget>[
//           Container(
//             width: 200,
//             height: 500,
//             color: Colors.red,
//           ),
//           Container(
//             width: 200,
//             height: 300,
//             color: Colors.black,
//           )
//         ]),
//         // child: Text(
//         //   'NTUMarket',
//         //   style: TextStyle(
//         //     color: Color.fromARGB(255, 7, 0, 95),
//         //     fontSize: 50,
//         //     fontWeight: FontWeight.bold,
//         //   ),
//       ),
//     ));
//   }
// }

// class buildBackGround extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Center(
//       child: Container(
//         width: 400,
//         height: 800,
//         color: Colors.grey,
//       ),
//     );
//   }
// }

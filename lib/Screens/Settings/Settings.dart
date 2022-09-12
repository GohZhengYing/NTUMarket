import 'package:cz3002app/Screens/EditProfile/EditProfile.dart';
import 'package:flutter/material.dart';

import '../EditPost/EditPost.dart';

class Settings extends StatelessWidget{
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("NTUMARKET"),
      ),
      body:
      Column(
        children: [
          Row(children: [Text("\n")]),
          Text("SETTINGS",style: TextStyle(decoration: TextDecoration.underline),),
          OutlinedButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const EditProfile()));
          },
              child: const Text('Edit Profile'),
            style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.transparent))
            ,),
          OutlinedButton(onPressed: () {debugPrint('Clicked');},
            child: const Text('Customer Support'),
            style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.transparent))
            ,),
          OutlinedButton(onPressed: () {debugPrint('Clicked');},
            child: const Text('Log Out'),
            style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.transparent))
            ,)
        ],
      )


    );
  }
}
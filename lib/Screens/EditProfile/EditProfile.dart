import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

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
          Row(children: [Text("\n")],),
          Text("EDIT PROFILE",style: TextStyle(decoration: TextDecoration.underline),),
          OutlinedButton(onPressed: () {debugPrint('Clicked');},
            child: const Text('Change Password'),
            style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.transparent))
            ,),
        ],
      ),
    );
  }
}
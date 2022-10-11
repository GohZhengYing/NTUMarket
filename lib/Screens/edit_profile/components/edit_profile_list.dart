
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/model_provider.dart';
import '../../Welcome/welcome_screen.dart';
import '../../change_password/change_password_screen.dart';
import '../../home/home_screen.dart';

class EditProfileList extends StatelessWidget {
  const EditProfileList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return       Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding:EdgeInsets.fromLTRB(0, 30, 0, 10),
            child: SizedBox(
                width: MediaQuery.of(context).size.width *0.867,
                child:AutoSizeText('Edit Profile',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      fontFamily: 'Roboto',
                      fontSize: 25
                  ),)
            )
        ),
        OutlinedButton(onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ChangePasswordScreen())
          );
        },
          child: const Text('Change Password',style: TextStyle(color: Colors.black)),
          style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.transparent))
          ,),
        OutlinedButton(onPressed: () async {

          showDialog(
              context: context
              , builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Warning'),           // To display the title it is optional
              content: Text('Are you sure?'),   // Message which will be pop up on the screen
              // Action widget which will provide the user to acknowledge the choice
              actions: [
                TextButton(
                  onPressed: () async {
                    if(await DeleteAccount()){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => WelcomeScreen())
                      );}
                    else
                      print('delete failed');
                  },
                  child: Text('Yes'),
                ),
                TextButton(                     // FlatButton widget is used to make a text to work like a button
                  onPressed: () {
                    Navigator.pop(context);
                  },             // function used to perform after pressing the button
                  child: Text('No'),
                ),
              ],
            );
          });

        },
          child: const Text('Delete Account',style: TextStyle(color: Colors.black)),
          style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.transparent))
          ,),
      ],
    );
  }
}

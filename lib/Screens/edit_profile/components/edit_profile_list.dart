
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../change_password/change_password_screen.dart';

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
                child:Text('Edit Profile',
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
      ],
    );
  }
}

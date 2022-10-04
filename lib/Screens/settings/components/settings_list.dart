import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../models/post.dart';
import '../../../models/user.dart';
import '../../Login/login_screen.dart';
import '../../edit_profile/edit_profile_screen.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return       Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding:EdgeInsets.fromLTRB(0, 30, 0, 10),
            child: SizedBox(
                width: MediaQuery.of(context).size.width *0.867,
                child:Text('Settings',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      fontFamily: 'Roboto',
                      fontSize: 25
                  ),)
            )
        ),
        OutlinedButton(onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> EditProfileScreen(post: Post(title: '', price: '', image: '', category: '', description: '', id: '',))));
        },
          child: const Text('Edit Profile',style: TextStyle(color: Colors.black)),
          style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.transparent))
          ,),
        OutlinedButton(onPressed: () {debugPrint('Clicked');},
          child: const Text('Customer Support',style: TextStyle(color: Colors.black)),
          style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.transparent))
          ,),
        OutlinedButton(onPressed: () {
          final UserStorage userStorage = new UserStorage();
          userStorage.writeUser(User(email: '',token: '',image: '',favourite_id: []));
          print("logged out");
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const LoginScreen()));
        },
          child: const Text('Log Out',style: TextStyle(color: Colors.black)),
          style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.transparent))
          ,)
      ],
    );
  }
}

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;


class UserStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/user.json');
  }

  Future<Map<String,dynamic>> readUser() async {
    File file = await _localFile;
    if(await file.exists()) {
      try {
        // Read the file
        final contents = await file.readAsString();
        return json.decode(contents);
      } catch (e) {
        // If encountering an error, return 0
        print(e);
        return json.decode("{}");
      }
    }

    return json.decode("{}");
  }

  Future<File> writeUser(User user) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(json.encode(user));
  }
}

class User {
  final String email, token,image;
  final List<dynamic> favourite_id;



  User({
    required this.email,
    required this.token,
    required this.image,
    required this.favourite_id
  });

  // User.fromJson(Map<String,dynamic> json)
  //     :email = json['email'],
  // token = json['token'],
  // image = json['image'],
  // favourites = json['favourites'] as List<String>
  // ;

  factory User.fromJson(dynamic json) {
    // List<String> fav = [];
    //if(json['favourite_id'] != null &&json['favourite_id'].length > 0){
      //json['favourite_id'].map((l) => fav.add(l.toString()));
    //}
    return User(
    email: json['email']!=null? json['email']:"",
    token: json['token']!=null? json['token']:"",
    image: json['image']!=null? json['image']:"",
        favourite_id: json['favourite_id']!=null? json['favourite_id']:[]
    );

  }

  Map<String, dynamic> toJson() =>{
    'email':email,
    'token':token,
    'image':image,
    'favourite_id':favourite_id
  };
}
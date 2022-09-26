import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:NtuMarket/models/post.dart';
import 'package:NtuMarket/models/user.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;



final String url = "10.0.2.2:5000";

Future<bool> Initialize() async {

  final UserStorage userStorage = new UserStorage();
  User user = User.fromJson(await userStorage.readUser());

  print(await 'Storage Email:${user.email}, Token:${user.token}, image:${user.image}');

  if(user.token != '' && user.email != ''){
  print(true);
  var response = await http.post(Uri.http(url, "login"), body: {
    "email": user.email,
    "token": user.token,
  });
  if(json.decode(response.body)['status']){
    return true;
  }
  else
    return false;
  }
  else{
    return false;
  }


}

Future<bool> Login(String email,String password) async {
  print(email+','+password);
  final UserStorage userStorage = new UserStorage();

  var response = await http.post(Uri.http(url, "login"), body: {
    "email": email,
    "password": password,
  });

  if(json.decode(response.body)['status']){
    userStorage.writeUser(User.fromJson(json.decode(response.body)));
    print(User.fromJson(await userStorage.readUser()).token);
    return true;}
  else
    return false;


}

Future<bool> Signup(String email,String password) async {

  print(email+','+password);
  final UserStorage userStorage = new UserStorage();

  var response = await http.post(Uri.http(url, "account"), body: {
    "email": email,
    "password": password,
  });

  if(json.decode(response.body)['status']){
    userStorage.writeUser(User.fromJson(json.decode(response.body)));
    User user = User.fromJson(await userStorage.readUser());
    print(await 'Storage Email:${user.email}, Token:${user.token}, image:${user.image}');
    return true;}
  else
    return false;

}

Future<bool> CreatePost(String title,String description,String price, String image, String category) async {
  print(title+','+description+','+price+','+image+','+category);
  final PostStorage postStorage = new PostStorage();

  Iterable l = await postStorage.readPost();
  List<Post> posts = List<Post>.from(l.map((model)=> Post.fromJson(model)));

  // List<Post> posts = [Post(title:'title',price: 'price',image: 'image',category: 'category',description: 'description'),Post(title:'title',price: 'price',image: 'image',category: 'category',description: 'description')];
  //
  // postStorage.writePost(posts);
  print(await posts);
  // var response = await http.post(Uri.http(url, "post"), body: {
  //   "token":user.token,
  //   "image": image,
  //   "title": title,
  //   "description": description,
  //   "price": price,
  //   "category": category
  // });
  //
  // if(json.decode(response.body)['status']){
  //   userStorage.writeUser(User.fromJson(json.decode(response.body)));
  //   User user = User.fromJson(await userStorage.readUser());
  //   //print(await 'Storage Email:${user.email}, Token:${user.token}, image:${user.image}');
  //   return true;}
  // else
  //   return false;
  return true;

}


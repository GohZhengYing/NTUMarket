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
  final PostStorage postStorage = new PostStorage();

  if(user.token != '' && user.email != ''){
  print(true);
  var response = await http.post(Uri.http(url, "login"), body: {
    "email": user.email,
    "token": user.token,
  });

  if(json.decode(response.body)['status']){
    userStorage.writeUser(User.fromJson(json.decode(response.body)));
    List<Post> posts = [];
    Iterable l = json.decode(response.body)['posts'];
    for(int i =0;i<l.length;i++){
      posts.add(Post.fromJson( l.elementAt(i)));}

    postStorage.writePost(posts);

    print("post loaded");
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
  final PostStorage postStorage = new PostStorage();

  var response = await http.post(Uri.http(url, "login"), body: {
    "email": email,
    "password": password,
  });

  if(json.decode(response.body)['status']){
    userStorage.writeUser(User.fromJson(json.decode(response.body)));

    List<Post> posts = [];
    //print(json.decode(response.body)['posts'][0]['_id']);
    Iterable l = json.decode(response.body)['posts'];
    print("here");
    for(int i =0;i<l.length;i++){
      posts.add(Post.fromJson( l.elementAt(i)));}

    postStorage.writePost(posts);

    print("post loaded");
    return true;}
  else
    return false;


}

Future<bool> Signup(String email,String password) async {

  print(email+','+password);
  final UserStorage userStorage = new UserStorage();
  final PostStorage postStorage = new PostStorage();

  var response = await http.post(Uri.http(url, "account"), body: {
    "email": email,
    "password": password,
  });

  if(json.decode(response.body)['status']){
    userStorage.writeUser(User.fromJson(json.decode(response.body)));
    User user = User.fromJson(await userStorage.readUser());
    //print(await 'Storage Email:${user.email}, Token:${user.token}, image:${user.image}');

    List<Post> posts = [];
    Iterable l = json.decode(response.body)['posts'];
    for(int i =0;i<l.length;i++){
      posts.add(Post.fromJson( l.elementAt(i)));}

    postStorage.writePost(posts);

    return true;
  }
  else
    return false;

}

Future<bool> DeleteAccount() async {

  final UserStorage userStorage = new UserStorage();
  User user = User.fromJson(await userStorage.readUser());
  final PostStorage postStorage = new PostStorage();

  var response = await http.delete(Uri.http(url, "account"), body: {
    "email": user.email,
    "token": user.token,
  });

  if(json.decode(response.body)['status']){
    userStorage.writeUser(User(email: '',token: '',image: '',favourite_id: []));
    postStorage.writePost([]);


    print("deleted");

    return true;
  }
  else
    return false;

}

Future<bool> ForgetPassword(String email) async {

  print(email);

  var response = await http.patch(Uri.http(url, "login"), body: {
    "email": email,
  });

  if(json.decode(response.body)['status']){
    return true;}
  else
    return false;

}

Future<bool> ChangePassword(String password) async {

  print(password);

  final UserStorage userStorage = new UserStorage();
  User user = User.fromJson(await userStorage.readUser());

  var response = await http.patch(Uri.http(url, "account"), body: {
    "email":user.email,
    "token": user.token,
    "password": password,
  });

  if(json.decode(response.body)['status']){
    return true;}
  else
    return false;

}

Future<bool> CreatePost(String title,String description,String price, String image, String category) async {
  print("from provider"+title+','+description+','+price+','+image+','+category);
  final PostStorage postStorage = new PostStorage();
  final UserStorage userStorage = new UserStorage();
  User user = User.fromJson(await userStorage.readUser());


  var response = await http.post(Uri.http(url, "post"), body: {
    "email":user.email,
    "token":user.token,
    "image": image,
    "title": title,
    "description": description,
    "price": price,
    "category": category
  });

  List<Post> posts = [];
  if(json.decode(response.body)['status']){
    Iterable l = await json.decode(response.body)['posts'];

    for(int i =0;i<l.length;i++){
      posts.add(Post.fromJson( l.elementAt(i)));}
    postStorage.writePost(posts);


    return true;}
  else
    return false;


}

Future<bool> EditPost(String title,String description,String price, String image, String category, String id) async {
  print(title+','+description+','+price+','+image+','+category);
  final PostStorage postStorage = new PostStorage();
  final UserStorage userStorage = new UserStorage();
  User user = User.fromJson(await userStorage.readUser());


  var response = await http.patch(Uri.http(url, "post"), body: {
    "email":user.email,
    "token":user.token,
    "image": image,
    "title": title,
    "description": description,
    "price": price,
    "category": category,
    '_id':id
  });

  List<Post> posts = [];
  if(json.decode(response.body)['status']){
    Iterable l = await json.decode(response.body)['posts'];

    for(int i =0;i<l.length;i++){
      posts.add(Post.fromJson( l.elementAt(i)));}
    postStorage.writePost(posts);


    return true;}
  else
    return false;


}

Future<bool> DeletePost(String id) async {
  print(id);
  final PostStorage postStorage = new PostStorage();
  final UserStorage userStorage = new UserStorage();
  User user = User.fromJson(await userStorage.readUser());


  var response = await http.delete(Uri.http(url, "post"), body: {
    "email":user.email,
    "token":user.token,
    "id": id,

  });

  List<Post> posts = [];
  if(json.decode(response.body)['status']){
    Iterable l = await json.decode(response.body)['posts'];

    for(int i =0;i<l.length;i++){
      posts.add(Post.fromJson( l.elementAt(i)));}
    postStorage.writePost(posts);
    return true;}
  else
    return false;


}

Future<List<Post>> SearchPost(String title,String category) async {

  final UserStorage userStorage = new UserStorage();
  User user = User.fromJson(await userStorage.readUser());
  title = title!=''?title:'EmPtYtItLe';
  category = category!=''?category:'All';
  print('.'+title+'and'+category);
  var response = await http.get(Uri.http(url, "post/${title}/${category}"));

  List<Post> posts = [];
  if(json.decode(response.body)['status']){
    Iterable l = await json.decode(response.body)['posts'];
    for(int i =0;i<l.length;i++){
      posts.add(Post.fromJson( l.elementAt(i)));}
    return posts;}
  else
    return [];


}

Future<bool> AddFavourites(String id) async {
  print(id);
  final PostStorage postStorage = new PostStorage();
  final UserStorage userStorage = new UserStorage();
  User user = User.fromJson(await userStorage.readUser());


  var response = await http.post(Uri.http(url, "account/"+user.email), body: {
    "email":user.email,
    "token":user.token,
    "id": id,

  });

  if(json.decode(response.body)['status']){
    userStorage.writeUser(User.fromJson(json.decode(response.body)));
    return true;}
  else
    return false;


}

Future<List<Post>> FetchFavourites() async {

  final UserStorage userStorage = new UserStorage();
  User user = User.fromJson(await userStorage.readUser());


  var response = await http.get(Uri.http(url, "account/"+user.email));

  List<Post> posts = [];
  if(json.decode(response.body)['status']){
    Iterable l = await json.decode(response.body)['posts'];

    for(int i =0;i<l.length;i++){
      posts.add(Post.fromJson( l.elementAt(i)));}
    return posts;}
  else
    return [];


}


Future<bool> DeleteFavourites(String id) async {
  print(id);
  final PostStorage postStorage = new PostStorage();
  final UserStorage userStorage = new UserStorage();
  User user = User.fromJson(await userStorage.readUser());


  var response = await http.delete(Uri.http(url, "account/"+user.email), body: {
    "email":user.email,
    "token":user.token,
    "id": id,

  });

  if(json.decode(response.body)['status']){
    userStorage.writeUser(User.fromJson(json.decode(response.body)));
    return true;}
  else
    return false;


}

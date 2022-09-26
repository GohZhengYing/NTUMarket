import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;


class PostStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/post.json');
  }

  Future<List<Post>> readPost() async {
    File file = await _localFile;

    if(await file.exists()) {
      try {
        // Read the file
        final contents = await file.readAsString();
        Iterable l = await json.decode(contents);
        List<Post> posts = [];
        for(int i =0;i<l.length;i++){
        posts.add(Post.fromJson( l.elementAt(i)));}
        print(posts);
        return posts;
      } catch (e) {
        // If encountering an error, return 0
        print(e);
        return json.decode("{}");
      }
    }

    return json.decode("{}");
  }

  Future<File> writePost(List<Post> posts) async {
    final file = await _localFile;

    //List<Post> encodedPosts = List<Post>.from(posts.map((model)=> json.encode(model)));
    // Write the file
    print(json.encode(posts));
    return file.writeAsString(json.encode(posts));
  }
}




class Post {
  final String title, price, description, image, category;



  Post({
    required this.title,
    required this.price,
    required this.image,
    required this.category,
    required this.description,
  });

  Post.fromJson(Map<String,dynamic> json)
      :description = json['description'],
        category = json['category'],
        image = json['image'],
        price = json['price'],
        title = json['title']
  ;

  Map<String, dynamic> toJson() =>{
    'title':title,
    'price':price,
    'image':image,
    'category':category,
    'description':description
  };
}
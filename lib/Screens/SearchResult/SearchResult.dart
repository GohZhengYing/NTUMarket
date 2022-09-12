import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget{
  const SearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    List<int> text = [1,2,3,4];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Results"),
      ),
      body: Container(
        child: Column(
          children: [
            for (var i in text)
              //TODO add query result
              Text(i.toString())
          ],
        ),
      )
      ,
    );
  }
  }

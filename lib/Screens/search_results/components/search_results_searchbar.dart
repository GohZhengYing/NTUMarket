import 'package:NtuMarket/models/model_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/post.dart';
class SearchResultsSearchbar extends StatefulWidget {
  SearchResultsSearchbar({Key? key,required this.searchInput,required this.result}) : super(key: key);
  List<Post> result;
  TextEditingController searchInput;

  @override
  _SearchResultsSearchbarState createState() => _SearchResultsSearchbarState();
}

class _SearchResultsSearchbarState extends State<SearchResultsSearchbar> {




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20,10, 20, 0),
      child:       TextFormField(
        controller: widget.searchInput,
        decoration: InputDecoration(
          hintText: 'Search',
          suffixIcon: IconButton(onPressed: () async {
            List<Post> _result = await SearchPost(widget.searchInput.text,'') ;
            setState(() {
              widget.result = _result;
            });
      }, icon: Icon(Icons.search)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              )
          ),
          focusColor: Colors.white,
          fillColor: Color(0x6561E4D5),
          filled: true,

        ),

      ),
    );
  }
}

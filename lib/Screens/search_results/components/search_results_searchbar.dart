import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchResultsSearchbar extends StatelessWidget {
  const SearchResultsSearchbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20,10, 20, 0),
      child:       TextFormField(

        decoration: InputDecoration(
          hintText: 'Search',
          suffixIcon: Icon(Icons.search),
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

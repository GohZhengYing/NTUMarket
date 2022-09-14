import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPageCategories extends StatefulWidget {
  const MainPageCategories({super.key});

  @override
  State<MainPageCategories> createState() => _MainPageCategoriesState();
}

class _MainPageCategoriesState extends State<MainPageCategories> {

  @override
  Widget build(BuildContext context) {
    final ButtonStyle CategoriesStyle =
    ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        minimumSize: Size(MediaQuery.of(context).size.width *0.4,40),
        maximumSize: Size(MediaQuery.of(context).size.width *0.4,40),
        backgroundColor: Color(0xFF61E4D5),
        disabledBackgroundColor: Color(0xFF61E4D5)
    );

    return Column(
      children: [
        Padding(
          padding:EdgeInsets.fromLTRB(0, 30, 0, 10),
          child: SizedBox(
              width: MediaQuery.of(context).size.width *0.867,
              child:Text('Categories',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                fontFamily: 'Roboto',
                fontSize: 17
              ),)
          )
        )
,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                ElevatedButton(
                  onPressed: null,
                  child: Text('Exam Papers'),
                  style: CategoriesStyle,
                ),
                ElevatedButton(
                  onPressed: null,
                  child: Text('Lecture Notes'),
                  style: CategoriesStyle,
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: null,
                  child: Text('Stationaries'),
                  style: CategoriesStyle,
                ),
                ElevatedButton(
                  onPressed: null,
                  child: Text('Hardware'),
                  style: CategoriesStyle,
                ),
              ],
            )
          ],
        ),
        ElevatedButton(
          onPressed: null,
          child: Text('Advance Search'),
          style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
              minimumSize: Size(MediaQuery.of(context).size.width *0.867,40),
              maximumSize: Size(MediaQuery.of(context).size.width *0.867,40),
              backgroundColor: Color(0xFF61E4D5),
              disabledBackgroundColor: Color(0xFF61E4D5)
          ),
        ),
      ],
    );
  }
}
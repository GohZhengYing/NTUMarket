import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../search_results/search_results_screen.dart';


class AdvancedSearchSearchbars extends StatelessWidget {
  AdvancedSearchSearchbars({Key? key}) : super(key: key);

  TextEditingController name = new TextEditingController();
  TextEditingController code = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Padding(
                padding:EdgeInsets.fromLTRB(0, 30, 0,0),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width *0.867,
                    child:Text('Name of Material',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          fontSize: 20
                      ),)
                )
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20,10, 20, 0),
              child:       TextFormField(
                controller: name,
                decoration: InputDecoration(
                  hintText: 'Name of Material',
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
            ),
            Padding(
                padding:EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width *0.867,
                    child:Text('Course Code',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          fontSize: 20
                      ),)
                )
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20,10, 20, 0),
              child:       TextFormField(
                controller: code,
                decoration: InputDecoration(
                  hintText: 'Course Code',
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
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10,20,10, 20),
          child: ElevatedButton(
            // When the user presses the button, show an alert dialog containing
            // the text that the user has entered into the text field.
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SearchResultsScreen(name: name.text,code: code.text)));
            },
            child: Text("Search"),
          ),
        )
      ],
    )
      ;
  }
}

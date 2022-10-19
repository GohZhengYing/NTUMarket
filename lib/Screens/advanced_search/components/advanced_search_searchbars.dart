import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_size_text/auto_size_text.dart';


import '../../search_results/search_results_screen.dart';


const List<String> list = <String>['All','Exam Papers(Student answers)', 'Stationaries', 'Lecture Notes', 'Hardware','Others'];

class AdvancedSearchSearchbars extends StatelessWidget {
  AdvancedSearchSearchbars({Key? key}) : super(key: key);

  TextEditingController name = new TextEditingController();
  TextEditingController category = new TextEditingController();
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
                    child:AutoSizeText('Name of Material',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          fontSize: 20
                      ),
                    )
                )
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20,10, 20, 0),
              child:       TextFormField(
                inputFormatters: [LengthLimitingTextInputFormatter(15)],
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
                    child:AutoSizeText('Category',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          fontSize: 20
                      ),)
                )
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20,10, 20, 0),
              child:DropdownButtonExample(cat:category),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10,20,10, 20),
          child: ElevatedButton(
            // When the user presses the button, show an alert dialog containing
            // the text that the user has entered into the text field.
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SearchResultsScreen(name: name.text,cat: category.text)));
            },
            child: AutoSizeText("Search"),
          ),
        )
      ],
    )
      ;
  }
}
class DropdownButtonExample extends StatefulWidget {
  TextEditingController cat;
  DropdownButtonExample({super.key,required this.cat});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded:true,
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.black87),
      underline: Container(
        height: 2,
        color: Colors.tealAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          widget.cat.text = value!;
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
  }

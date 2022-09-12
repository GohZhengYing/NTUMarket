import 'package:cz3002app/Screens/SearchResult/SearchResult.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_text'


class AdvanceSearch extends StatelessWidget {
  const AdvanceSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("NTUMARKET"),
      ),
      body: SearchFunction(),
    );
    }
  }
class SearchFunction extends StatefulWidget {
  const SearchFunction({super.key});

  @override
  State<SearchFunction> createState() => _SearchFunction();
}
class _SearchFunction extends State<SearchFunction>{
  late TextEditingController _controller;
  late TextEditingController _controller2;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller2 = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }
  @override
    Widget build(BuildContext context) {
        return Scaffold(

          body:Column(
            children: [
              Text("\nName of Material"),
            TextField(decoration: InputDecoration(border: OutlineInputBorder(),
                hintText: "Enter Name"
            ),
              controller: _controller,
            ),
            Text("\nCourse Code")
            ,
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Enter Course Code"),
              controller: _controller2,
            ),Text("\n\n\n\n"),
              ElevatedButton(
                // When the user presses the button, show an alert dialog containing
                // the text that the user has entered into the text field.
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const SearchResult()));
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        // Retrieve the text the that user has entered by using the
                        // TextEditingController.
                        content: Text(_controller.text + _controller2.text),
                      );
                    },
                  );
                },
                child: Text("Search"),
              )
          ],
          ),
      );
  }
}
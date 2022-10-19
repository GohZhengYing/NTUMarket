import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../constants.dart';
import '../../../models/model_provider.dart';


class CreatePostForm extends StatefulWidget {
  TextEditingController title_input;
  TextEditingController description_input ;
  TextEditingController price_input ;
  TextEditingController category_input;
  TextEditingController image_input ;
  bool submitted;
  Function ss;

  CreatePostForm({
    Key? key,
    required this.title_input,
    required this.description_input ,
    required this.price_input,
    required this.category_input,
    required this.image_input,
    required this.submitted,
    required this.ss

  }) : super(key: key);

  @override
  _CreatePostForm createState() => _CreatePostForm();


}

class _CreatePostForm extends State<CreatePostForm> {
  String dropdownvalue = 'Exam Papers(Student answers)';

  final title_input2 = TextEditingController();
  final price_input2 = TextEditingController();
  final desc_input2 = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();




  var items = [
    'Exam Papers(Student answers)',
    'Stationaries',
    'Lecture Notes',
    'Hardware',
    'Others',
  ];

  void initState(){
    setState(() {
      widget.category_input.text = items[0];
    });
  }


  @override

  Widget build(BuildContext context) {

    // if(widget.submitted)return Container(
    //   child: Center(
    //     child: SizedBox(height: 50.0,
    //       width:50.0,
    //       child: CircularProgressIndicator(),
    //     ),
    //   ),
    //   color: Colors.white,
    //
    // );

    return Form(
      key: formkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            controller: widget.title_input,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (title) {},
            validator: (value) {
              if (value!.isEmpty) {
                return "Title cannot be blank";
              } else {
                print("after");
                print(widget.image_input.text);
                return null;
              }
            },
            decoration: const InputDecoration(
              hintText: "Eye-catching title",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.adb_rounded),
              ),
            ),
          ),
          Padding(
            padding:  const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: widget.price_input,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (price) {},
              validator: (value) {
                if (value!.isEmpty) {
                  return "Price cannot be blank";
                } else {
                  return null;
                }
              },
              decoration: const InputDecoration(
                hintText: "Value of your item",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.account_balance_wallet_rounded),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          DropdownButton(
            value: dropdownvalue,
            icon: const Icon(Icons.keyboard_arrow_down),
            iconDisabledColor: kPrimaryColor,
            iconEnabledColor: kPrimaryColor,
            isExpanded:true,
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState((){
                widget.category_input.text = newValue!;
                dropdownvalue = newValue!;
              });
            },
          ),
          SizedBox(height: 5,),

          TextFormField(
            controller: widget.description_input,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            textInputAction: TextInputAction.done,
            validator: (value) {
              if (value!.isEmpty) {
                return "Description cannot be blank";
              } else {
                return null;
              }
            },
            cursorColor: kPrimaryColor,
            onSaved: (description) {},
            decoration: const InputDecoration(
              hintText: "Description of your item",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.abc),
              ),
            ),
          ),

          const SizedBox(
            height: 20,
          ),
          Hero(
            tag: "save_edit_button",
            child: ElevatedButton(
              onPressed: () async {
                if (formkey.currentState!.validate()) {
                  if (widget.category_input == null) {
                    setState(() {

                      widget.category_input.text = 'Exam Papers(Student answers)';
                    });
                  };

                  setState(() {
                    widget.ss();
                    // widget.submitted = true;
                  });


                  // setState(() {
                  //   widget.ss();
                  // });
                } else {
                  print("Incorrect input, please check again");
                }

              },
              child: const Text(
                "List It",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

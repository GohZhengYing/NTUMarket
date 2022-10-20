import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/model_provider.dart';
import '../../../models/post.dart';


// class EditPostForm extends StatelessWidget {
//   const EditPostForm({
//     Key? key,
// }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: Column(
//         children: [
//           TextFormField(
//             keyboardType: TextInputType.text,
//             textInputAction: TextInputAction.next,
//             cursorColor: kPrimaryColor,
//             onSaved: (title) {},
//             decoration: const InputDecoration(
//               hintText: "Best textbook ever",
//               prefixIcon: Padding(
//                 padding: EdgeInsets.all(defaultPadding),
//                 child: Icon(Icons.adb_rounded),
//               ),
//             ),
//           ),
//           Padding(
//             padding:  const EdgeInsets.symmetric(vertical: defaultPadding),
//             child: TextFormField(
//               keyboardType: TextInputType.number,
//               textInputAction: TextInputAction.next,
//               cursorColor: kPrimaryColor,
//               onSaved: (price) {},
//               decoration: const InputDecoration(
//                 hintText: "\$50",
//                 prefixIcon: Padding(
//                   padding: EdgeInsets.all(defaultPadding),
//                   child: Icon(Icons.account_balance_wallet_rounded),
//                 ),
//               ),
//             ),
//           ),
//           TextFormField(
//             keyboardType: TextInputType.multiline,
//             maxLines: null,
//             textInputAction: TextInputAction.done,
//             cursorColor: kPrimaryColor,
//             onSaved: (description) {},
//             decoration: const InputDecoration(
//               hintText: "For those who want to score GPA 5.0",
//               prefixIcon: Padding(
//                 padding: EdgeInsets.all(defaultPadding),
//                 child: Icon(Icons.abc),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Hero(
//             tag: "save_edit_button",
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text(
//                 "Save Edit",
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class EditPostForm extends StatefulWidget {
  TextEditingController title_input;
  TextEditingController description_input ;
  TextEditingController price_input ;
  TextEditingController category_input;
  TextEditingController image_input ;
  Post post;

  EditPostForm({
    Key? key,
    required this.title_input,
    required this.description_input ,
    required this.price_input,
    required this.category_input,
    required this.image_input,
    required this.post

  }) : super(key: key);

  @override
  _EditPostForm createState() => _EditPostForm();


}

class _EditPostForm extends State<EditPostForm> {
  String dropdownvalue = 'Exam Papers(Student answers)';
  bool submitted = false;

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  var items = [
    'Exam Papers(Student answers)',
    'Stationaries',
    'Lecture Notes',
    'Hardware',
    'Others',
  ];





  @override

  Widget build(BuildContext context) {


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
            validator: (value) {
              if (value!.isEmpty) {
                return "Title cannot be blank";
              } else {
                return null;
              }
            },
            decoration: const InputDecoration(
              hintText: "Title",
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
            cursorColor: kPrimaryColor,
            onSaved: (description) {},
            validator: (value) {
              if (value!.isEmpty) {
                return "Description cannot be blank";
              } else {
                return null;
              }
            },
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
                showDialog(
                    context: context
                    , builder: (BuildContext context) {
                  return Container(
                    child: Center(
                      child: SizedBox(height: 50.0,
                        width:50.0,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    color: Colors.white,

                  );
                }
                );
                if (formkey.currentState!.validate()) {
                  if (widget.category_input == null) {
                    setState(() {

                      widget.category_input.text = 'Exam Papers-Student answers';
                    });
                  };
                  setState(() {
                    submitted = true;
                  });
                  if (await EditPost(
                      widget.title_input.text, widget.description_input.text,
                      widget.price_input.text, widget.image_input.text,
                      widget.category_input.text, widget.post.id)) {
                    print('edited post');
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context, 'refresh');
                  }
                  else
                    {print('edit failed');
                    Navigator.pop(context);}



                } else {
                  print("Incorrect input, please check again");
                }
              },
              child: Text(
                "Save Edit",
              ),
            ),
                    )
        ],
      ),
    );
  }
}

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
  String dropdownvalue = 'Electronics';



  var items = [
    'Electronics',
    'Textbook',
    'Other stuff',
  ];




  @override

  Widget build(BuildContext context) {
    return Form(

      child: Column(
        children: [
          TextFormField(
            controller: widget.title_input,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
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
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (price) {},
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
            keyboardType: TextInputType.multiline,
            maxLines: null,
            textInputAction: TextInputAction.done,
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
                if(widget.category_input== null){
                  setState(() {
                    widget.category_input.text = 'Electronics';
                  });
                };
                if(await EditPost(widget.title_input.text ,widget.description_input.text,widget.price_input.text,widget.image_input.text,widget.category_input.text,widget.post.id)){

                print('edited post');
                Navigator.pop(context);
                Navigator.pop(context);
                }
                else
                print('edit failed');
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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';


class CreatePostForm extends StatefulWidget {
  const CreatePostForm({
    Key? key,
  }) : super(key: key);

  @override
  _CreatePostForm createState() => _CreatePostForm();
}

class _CreatePostForm extends State<CreatePostForm> {
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
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (title) {},
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
                dropdownvalue = newValue!;
              });
            },
          ),
          SizedBox(height: 5,),
          TextFormField(
            keyboardType: TextInputType.text,
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
              onPressed: () {},
              child: Text(
                "List It",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
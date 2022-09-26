import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/model_provider.dart';


class CreatePostForm extends StatefulWidget {
  const CreatePostForm({
    Key? key,
  }) : super(key: key);

  @override
  _CreatePostForm createState() => _CreatePostForm();


}

class _CreatePostForm extends State<CreatePostForm> {
  String dropdownvalue = 'Electronics';

  final title_input = TextEditingController();
  final description_input = TextEditingController();
  final price_input = TextEditingController();
  final category_input = TextEditingController();
  final image_input = TextEditingController();

  var items = [
    'Electronics',
    'Textbook',
    'Other stuff',
  ];


  @override

  Widget build(BuildContext context) {
    category_input.text = 'Electronics';
    image_input.text = 'image';
    return Form(

      child: Column(
        children: [
          TextFormField(
            controller: title_input,
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
              controller: price_input,
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
                category_input.text = newValue;
              });
            },
          ),
          SizedBox(height: 5,),

          TextFormField(
            controller: description_input,
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
                if(await CreatePost(title_input.text ,description_input.text,price_input.text,image_input.text,category_input.text)){
                  print('created post');
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => HomeScreen()
                  //     )
                  // );
                }
                else
                  print('post failed');

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
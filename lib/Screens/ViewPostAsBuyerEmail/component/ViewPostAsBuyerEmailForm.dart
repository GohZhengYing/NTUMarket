import 'package:cz3002app/Screens/Login/login_screen.dart';
import 'package:cz3002app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ViewPostAsBuyerEmailForm extends StatelessWidget {
  const ViewPostAsBuyerEmailForm({
    Key? key,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [

          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            cursorColor: kPrimaryColor,
            onSaved: (description) {},
            decoration: const InputDecoration(
              hintText: "Message",
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
                "Send Email",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
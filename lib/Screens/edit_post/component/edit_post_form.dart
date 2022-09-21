import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';


class EditPostForm extends StatelessWidget {
  const EditPostForm({
    Key? key,
}) : super(key: key);

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
              hintText: "Best textbook ever",
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
                hintText: "\$50",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.account_balance_wallet_rounded),
                ),
              ),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            textInputAction: TextInputAction.done,
            cursorColor: kPrimaryColor,
            onSaved: (description) {},
            decoration: const InputDecoration(
              hintText: "For those who want to score GPA 5.0",
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
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Save Edit",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
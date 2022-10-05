

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/hotmail.dart';

import '../../../constants.dart';


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
            keyboardType: TextInputType.multiline,
            maxLines: null,
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
              onPressed: () {
                sendEmail();
                Navigator.pop(context);
                Navigator.pop(context);
              },
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

Future sendEmail() async{
  final email = 'gohz0042@e.ntu.edu.sg';

  final smtpServer = hotmail('gohz0042@e.ntu.edu.sg','Monopolydeal456');
  final message = Message()
    ..from = Address(email,'Zheng ying')
    ..recipients = ['gohz0042@e.ntu.edu.sg']
    ..subject = 'test'
    ..text = 'hello';


  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
}
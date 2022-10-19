import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constants.dart';

// class CreatePostImage extends StatelessWidget {
//   const CreatePostImage({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: const [
//             Spacer(),
//             Expanded(
//               flex: 8,
//               child: Image(image: AssetImage('assets/images/NTUPaper.jpg'),height: 200,),
//             ),
//             Spacer(),
//           ],
//         ),
//         const Icon(
//             Icons.add_a_photo_outlined,
//             size:30.0,
//         ),
//       ],
//     );
//   }
// }
class CreatePostImage extends StatefulWidget {
  XFile? image;
  TextEditingController image_input ;

  CreatePostImage({Key? key,required this.image,required this.image_input}) : super(key: key);

  @override
  _CreatePostImageState createState() => _CreatePostImageState();
}

class _CreatePostImageState extends State<CreatePostImage> {



  final ImagePicker picker = ImagePicker();



  Future getImage(ImageSource media) async {
    // await picker.retrieveLostData();
    var img = await picker.pickImage(source: media);

    setState(() {
      widget.image = img;
      widget.image_input.text = base64Encode(File(widget.image?.path ?? "").readAsBytesSync());
    });
  }

//show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  TextButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  TextButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Row(
          children: [
            Spacer(),
            Expanded(
                flex: 8,
                child: widget.image_input.text != ""
                    ? Center(
                  child: Image.memory( Base64Decoder().convert(widget.image_input.text),height: 200),
                )
                //Image.memory( Base64Decoder().convert(widget.image_input.text))
                    : Center(
                      child: Text(
                        "No Image",
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
            Spacer(),
          ],
        ),
        IconButton(
            onPressed: () => {myAlert()},
            icon: Icon(
              Icons.add_a_photo_outlined,
              size: 30.0,
            )),
      ],
    );
  }
}

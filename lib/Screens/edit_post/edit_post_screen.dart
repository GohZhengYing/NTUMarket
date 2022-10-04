
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';

import '../../models/post.dart';
import 'component/colordot.dart';
import 'component/edit_post_form.dart';

import 'package:flutter/material.dart';
import '../../constants.dart';
import 'component/edit_post_image.dart';
import 'package:image_picker/image_picker.dart';

class EditPostScreen extends StatefulWidget {
  Post post;
  EditPostScreen({Key? key,required this.post}) : super(key: key);

  @override
  _EditPostScreenState createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {

  XFile? image;
  final title_input = TextEditingController();
  final description_input = TextEditingController();
  final price_input = TextEditingController();
  final category_input = TextEditingController();
  final image_input = TextEditingController();

  // void initState(){
  //   super.initState();
  //   setState((){
  //     title_input.text = widget.post.title;
  //     description_input.text = widget.post.description;
  //     price_input.text = widget.post.price;
  //     category_input.text = widget.post.category;
  //     image_input.text = widget.post.image;
  //   });
  // }

  void initState(){
    title_input.text = widget.post.title;
    description_input.text = widget.post.description;
    price_input.text = widget.post.price;
    category_input.text = widget.post.category;
    image_input.text = widget.post.image;

    return super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async => false,
      child: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(onPressed:() {Navigator.pop(context);}, icon: Icon(Icons.keyboard_arrow_left),color: Colors.black,iconSize: 40),
            actions: [
              IconButton(
                onPressed: () {},
                icon: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    "assets/images/Dora.jpg",
                    height: 20,
                  ),
                ),
              ),
            ],
          ),
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child:Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                            child: EditPostImage(image_input: image_input,image: image,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: EditPostForm(title_input: title_input, description_input: description_input, price_input: price_input, category_input: category_input, image_input: image_input,post:widget.post),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

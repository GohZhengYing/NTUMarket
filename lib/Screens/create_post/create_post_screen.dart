import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';

import '../Favourites/favourites_screen.dart';

import 'package:flutter/material.dart';
import '../../constants.dart';
import '../home/home_screen.dart';
import 'component/create_post_form.dart';
import 'component/create_post_image.dart';
class CreatePostScreen extends StatefulWidget {
  CreatePostScreen({Key? key}) : super(key: key);
  XFile? image;
  final title_input = TextEditingController();
  final description_input = TextEditingController();
  final price_input = TextEditingController();
  final category_input = TextEditingController();
  final image_input = TextEditingController();

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}
class _CreatePostScreenState extends State<CreatePostScreen> {


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.keyboard_arrow_left),
                color: Colors.black,
                iconSize: 40),
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
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CreatePostImage(image: widget.image,image_input: widget.image_input,),
                            const SizedBox(height: 20),
                            Row(children: [
                              Spacer(),
                              Expanded(
                                flex: 8,
                                child: CreatePostForm(
                                    title_input: widget.title_input,
                                    description_input: widget.description_input,
                                    price_input: widget.price_input,
                                    category_input: widget.category_input,
                                    image_input: widget.image_input,
                                ),
                              ),
                              Spacer(),
                            ]),
                          ],
                        ),
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

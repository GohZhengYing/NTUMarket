import 'package:flutter/material.dart';
import 'components/advanced_search_searchbars.dart';
//import 'package:flutter_text'


class AdvancedSearchScreen extends StatelessWidget {
  const AdvancedSearchScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    late TextEditingController _controller;
    late TextEditingController _controller2;

    _controller = TextEditingController();
    _controller2 = TextEditingController();

    void dispose() {
      _controller.dispose();
      _controller2.dispose();
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(onPressed:() {Navigator.pop(context);}, icon: Icon(Icons.keyboard_arrow_left),color: Colors.black,iconSize: 40),
            shadowColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 100,
            backgroundColor: Color(0xFF61E4D5),
            flexibleSpace: Image(
                image:AssetImage('assets/images/NTUMarketLogo.png'),
                fit:BoxFit.cover)
            ,
            centerTitle: true,
          ),
          body: AdvancedSearchSearchbars()

        ),
      ),
    );
    }
  }

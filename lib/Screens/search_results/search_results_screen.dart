import 'package:flutter/material.dart';

import '../../data/model_provider.dart';
import '../../models/post.dart';
import 'components/search_results_results_list.dart';
import 'components/search_results_searchbar.dart';

class SearchResultsScreen extends StatefulWidget {
  String name;
  String cat;

  SearchResultsScreen({Key? key,required this.name,required this.cat}) : super(key: key);

  @override
  _SearchResultsScreenState createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  bool searchSubmitted = false;
  TextEditingController searchInput = new TextEditingController();
  List<Post> result = [];
  bool submitted = true;

  Future<void> SearchPosts() async {
    super.initState();
    List<Post> _result = await SearchPost(widget.name,widget.cat) ;
    setState(() {
      result = _result;
      submitted = false;
    });
  }

  // This widget is the root of your application.

  void initState(){
    super.initState();
    SearchPosts();
  }


  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(onPressed:() {Navigator.pop(context);}, icon: Icon(Icons.keyboard_arrow_left),color: Colors.black,iconSize: 40),
            shadowColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 100,
            backgroundColor: Color(0xFF61E4D5),
            flexibleSpace: Image(
                image:AssetImage('assets/images/NTUMarketLogoTopLeft.png'),
                fit:BoxFit.cover)
            ,
            title: Text("Results",style: TextStyle(color: Color(0xFF100557),fontSize: 40),),
            centerTitle: true,
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
                        children: [
                          submitted?
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
                                child: Container(
                                child: Center(
                                child: SizedBox(height: 50.0,
                                width:50.0,
                                child: CircularProgressIndicator(),
                                ),
                                ),
                                color: Colors.white,

                          ),
                              ):

                          //SearchResultsSearchbar(searchInput: searchInput,result: result,),
                          SearchResultsResultsList(result: result,)
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


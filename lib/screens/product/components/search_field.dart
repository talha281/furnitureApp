import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_app/Utils/navigator_class.dart';
import 'package:furniture_app/models/product.dart';
import 'package:furniture_app/screens/details/details_screen.dart';

import '../../../constants.dart';

class SearchData extends StatefulWidget {
  @override
  _SearchDataState createState() => _SearchDataState();
}

class _SearchDataState extends State<SearchData> {
  List<Product> productList = products;
  TextEditingController controller = TextEditingController();
  FocusNode focusNode;
  List<Product> prodList = [];

 RichText _search(String prodName, String searchQuery) {
    String preQuery = '';
    String postQuery = '';

    if (!prodName.startsWith(searchQuery)) {
      preQuery = prodName.substring(0, prodName.indexOf(searchQuery));
    }
    postQuery = prodName.substring(preQuery.length + searchQuery.length);
    return RichText(
      text: TextSpan(
        text: preQuery,
        style: TextStyle(color: Colors.black),
        children: [
          TextSpan(
            text: searchQuery,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: postQuery,
            style: TextStyle(fontWeight: FontWeight.normal), 
          ),
        ],
      ),
    );
  }

  searchFunc(String controller) {
    List<Product> prodList = productList
        .where((element) => element.title.contains(controller))
        .toList();
    setState(() {
      this.prodList = prodList;
    });
    //searchFunc(controller);
  }

  addlistener() {
    if (controller.text.isEmpty) {
      setState(() {
        productList = products;
      });
    }
    searchFunc(controller.text);
    controller.addListener(() {
      searchFunc(controller.text);
    });
  }

  @override
  void initState() {
    addlistener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.only(left: kDefaultPadding),
          icon: Icon(Icons.arrow_back),color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          if (controller.text.isNotEmpty)
            IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  controller.clear();
                })
        ],
        title: SearchBar(
            controller: controller,
            focusNode: focusNode,
            onChange: addlistener()
            //searchFunc(controller.text),
            ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (controller.text.isNotEmpty && prodList.isEmpty)
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  'No Matches Found!',
                  style: TextStyle(fontSize: 20),
                ),
              )),
            if (controller.text.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: prodList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigation.pushNavigation(
                              context,
                              DetailsScreen(
                                product: prodList[index],
                              ));
                        },
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(""),
                            Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: _search(
                                    prodList[index].title, controller.text)),
                          ],
                        ),
                      ),
                      Divider()
                    ],
                  );
                },
              )
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  SearchBar({this.focusNode, this.controller, this.onChange});
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kDefaultPadding),
      // width: ,
      padding: EdgeInsets.symmetric(
          //horizontal: kDefaultPadding,
          //vertical: kDefaultPadding / 4, // 5 top and bottom
          ),
      // decoration: BoxDecoration(
      //   color: Colors.white.withOpacity(0.4),
      //   borderRadius: BorderRadius.circular(12),
      // ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        onChanged: onChange,
        keyboardType: TextInputType.name,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

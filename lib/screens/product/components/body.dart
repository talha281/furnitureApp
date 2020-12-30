import 'package:flutter/material.dart';
import 'package:furniture_app/Utils/navigator_class.dart';
import 'package:furniture_app/components/search_box.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/models/category.dart';
import 'package:furniture_app/models/product.dart';
import 'package:furniture_app/screens/details/details_screen.dart';
import 'package:furniture_app/screens/product/components/search_field.dart';
import 'category_list.dart';
import 'product_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int selectedIndex = 0;
  String catId = '';
  List<Product> productList = products;

  func(String catId) {
    if (catId != 'AC') {
      List<Product> prodlist = products
          .where((element) => element.category.categoryId == catId)
          .toList();
      setState(() {
        productList = prodlist;
      });
    } else {
      productList = products;
    }
    return productList;
  }

  @override
  void initState() {
    setState(() {
      productList = products;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Column(
        children: <Widget>[
          GestureDetector(
            child: SearchBox(),
            onTap: () {
              // showSearch(context: context, delegate: delegate)
              Navigation.pushNavigation(context, SearchData());
            },
          ),
          // SearchBox(),
          Container(
            margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2.5),
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: CategoryList(
                    index: index,
                    selectedIndex: selectedIndex,
                  ),
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      catId = categories[index].categoryId;
                    });
                    func(catId);
                    print(catId);
                    print(productList);
                  },
                );
              },
            ),
          ),
          SizedBox(height: kDefaultPadding / 2),
          Expanded(
            child: Stack(
              children: <Widget>[
                // Our background
                Container(
                  margin: EdgeInsets.only(top: 70),
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),

                if (productList.isEmpty)
                  Center(
                      child: Text(
                    'No macthes found!',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  )),
                ListView.builder(
                  // here we use our demo procuts list
                  itemCount: productList.length,
                  itemBuilder: (context, index) => ProductCard(
                    itemIndex: index,
                    product: productList[index],
                    press: () {
                      Navigation.pushNavigation(
                        context,
                        DetailsScreen(
                          product: productList[index],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

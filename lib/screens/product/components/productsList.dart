import 'dart:math';

import 'package:flutter/material.dart';
import 'package:furniture_app/Utils/navigator_class.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/models/product.dart';
import 'package:furniture_app/screens/details/details_screen.dart';
import 'package:furniture_app/screens/product/components/product_card.dart';

class ProductClass extends StatefulWidget {
  final String categoryName;
  final String categoryId;

  const ProductClass({this.categoryName, this.categoryId});

  @override
  _ProductClassState createState() => _ProductClassState();
}

class _ProductClassState extends State<ProductClass> {
  String categoryName;
  String categoryId;
  List<Product> prodzList = [];
  bool isListView = false;

  MaterialColor _bgColors = availableColors[Random().nextInt(7)];

  listFunc(String categoryId) {
    List<Product> prozlist = [];
    if (categoryId == 'AC') prozlist = products;

    if (categoryId != 'AC')
      prozlist = products
          .where((element) => element.category.categoryId == categoryId)
          .toList();
    setState(() {
      prodzList = prozlist;
    });
  }

  @override
  void initState() {
    setState(() {
      categoryName = widget.categoryName;
      categoryId = widget.categoryId;
    });
    listFunc(categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          categoryName,
          style: TextStyle(fontSize: 23),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (isListView == false) {
                  isListView = true;
                } else {
                  isListView = false;
                }
              });
            },
            child: Container(
              padding: EdgeInsets.only(right: 20),
              child: (isListView)
                  ? Icon(
                      Icons.grid_view,
                    )
                  : Icon(Icons.list, size: 28),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 170),
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
          ),
          (isListView)
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: prodzList.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      itemIndex: index,
                      product: prodzList[index],
                      press: () {
                        Navigation.pushNavigation(
                            context,
                            DetailsScreen(
                              product: prodzList[index],
                            ));
                      },
                    );
                  },
                )
              : GridView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: prodzList.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1.8 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigation.pushNavigation(
                              context,
                              DetailsScreen(
                                product: prodzList[index],
                              ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(18),
                                topLeft: Radius.circular(18),
                                bottomLeft: Radius.circular(18)),
                            color: index == 2
                                ? kBlueColor
                                : index == 1
                                    ? kSecondaryColor
                                    : index == 3
                                        ? Colors.teal
                                        : index == 4
                                            ? Colors.red
                                            : index == 5
                                                ? Colors.pink
                                                : Colors.purple,
                            boxShadow: [kDefaultShadow],
                          ),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(18),
                                  topLeft: Radius.circular(18),
                                  bottomLeft: Radius.circular(18)),
                            ),
                            child: GridTile(
                                child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    child: Stack(
                                      children: [
                                        Column(
                                          children: [
                                            Text(''),
                                            Hero(
                                              tag: '${prodzList[index].id}',
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        kDefaultPadding),
                                                height: 100,
                                                // image is square but we add extra 20 + 20 padding thats why width is 200
                                                width: 200,
                                                child: Image.asset(
                                                  prodzList[index].image,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 1, top: 20),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: kPrimaryColor,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(38),
                                              bottomLeft: Radius.circular(14),
                                              bottomRight: Radius.circular(38)),
                                        ),
                                        height: 45,
                                        //color: kPrimaryColor,
                                        width: 150,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Container(
                                                width: 120,
                                                child: Text(
                                                  prodzList[index].title,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                  "₹${prodzList[index].price.toString()}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 22,
                                                      color: Colors.white)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
                          ),
                        ),
                      ),
                    );
                  })
        ],
      ),
    );
  }
}

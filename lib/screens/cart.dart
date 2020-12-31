import 'package:flutter/material.dart';
import 'package:furniture_app/Utils/qunatity_manager.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/models/product.dart';
import 'package:furniture_app/provider_class/provider_class.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  final int quantity;

  const CartScreen({Key key, this.quantity}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int quantity = 1;

  @override
  void initState() {
    quantity = 1;
    setState(() {
      quantity = widget.quantity;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var ccart = Provider.of<Cart>(context);
    final productz = ccart.productItemList;
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        backgroundColor: kPrimaryColor,
        body: ccart.productItemList.length == 0
            ? Center(
                child: Text(
                  emptyCartText,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: productz.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
                    child: Stack(
                      children: [
                        Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.grey.shade300,
                            boxShadow: [kDefaultShadow],
                          ),
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(right: 6, top: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8, left: 5, right: 3),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          height: 105,
                                          child: Image.asset(
                                            productz[index].product.image,
                                            fit: BoxFit.cover,
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 12),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              productz[index].product.title,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 4, top: 4),
                                              child: Text(
                                                productz[index]
                                                    .product
                                                    .category
                                                    .categoryName,
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 15),
                                              ),
                                            ),
                                            Text(
                                              "₹${productz[index].product.price.toString()}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 32),
                                            ),
                                            Row(
                                              children: [
                                                QuantityManager(
                                                  quantity:
                                                      productz[index].quantity,
                                                  minusCallback: () {
                                                    ccart.removeProductItem(
                                                        productz[index]);
                                                  },
                                                  plusCallback: () {
                                                    ccart.addProductItem(
                                                        productz[index]
                                                            .product);
                                                  },
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 1, top: 5),
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: 35,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade300),
                                child: IconButton(
                                  iconSize: 20,
                                  icon: Icon(Icons.clear),
                                  onPressed: () {
                                    ccart.removeProductItem(productz[index]);
                                  },
                                ),
                              )),
                        )
                      ],
                    ),
                  );
                }));
  }
}

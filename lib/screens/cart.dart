import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/provider_class/provider_class.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var ccart = Provider.of<CartModel>(context);
    final productz = ccart.productItemList;
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        backgroundColor: kPrimaryColor,
        body: ccart.productItemList.length == 0
            ? Text('no items in your cart')
            : ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: productz.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(productz[index].title,
                          style: TextStyle(color: Colors.white)));
                }));
  }
}

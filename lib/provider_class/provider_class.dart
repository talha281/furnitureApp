import 'package:flutter/cupertino.dart';
import 'package:furniture_app/models/product.dart';

class CartModel extends ChangeNotifier {
  List<Product> productItemList = [];

  addProductItem(String title,int id) {
    Product productItem = Product(
        id: id,
        title:title,
       );

    productItemList.add(productItem);
    notifyListeners();
    print(productItemList);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:furniture_app/models/product.dart';

class CartModel extends ChangeNotifier {
  List<Product> _productItemList = [];

  addProductItem(String title, int id) {
    Product productItem = Product(
      id: id,
      title: title,
    );

    _productItemList.add(productItem);
    notifyListeners();
    print(_productItemList);
  }

  List<Product> get productItemList {
    return _productItemList;
  }
}

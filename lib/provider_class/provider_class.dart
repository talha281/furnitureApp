import 'package:flutter/cupertino.dart';
import 'package:furniture_app/models/cart_model.dart';
import 'package:furniture_app/models/product.dart';

class Cart extends ChangeNotifier {
  List<CartModel> _productItemList = [];
  int quantity = 1;
  //List<Product> _duplicatesList = [];

  addQuantity(CartModel cartModel) {
    cartModel.quantity++;
  }

  removeQuantity() {}

  addProductItem(Product product) {
    if (_productItemList.contains(product)) {
      quantity++;
    }
    CartModel productItem = CartModel(product: product, quantity: quantity);
    // title: product.title,
    // price: product.price,
    // image: product.image,
    // id: product.id,
    // description: product.description,
    // category: product.category);

    // List<Product> duplicList =
    //     _productItemList.where((element) => element.id == product.id).toList();
    // if (duplicList.isEmpty) {
    // }
    _productItemList.add(productItem);

    notifyListeners();
  }

  removeProductItem(CartModel product) {
    if (quantity > 1) {
      quantity--;
    } else
      _productItemList.removeAt(_productItemList.indexOf(product));
    // duplicatesList.removeAt(duplicatesList.indexOf(product));
    notifyListeners();
    print(_productItemList);
  }

  List<CartModel> get productItemList {
    return _productItemList;
  }
}

import 'package:flutter/cupertino.dart';
import 'package:furniture_app/models/cart_model.dart';
import 'package:furniture_app/models/product.dart';

class Cart extends ChangeNotifier {
  List<CartModel> _productItemList = [];
  int quantity = 1;


  addProductItem(Product product) {
    if (_productItemList.isNotEmpty) {
      CartModel cartItem = _productItemList
          ?.firstWhere((element) => element.product.id == product.id);
      if (cartItem == null) {
        _addNewProduct(product);
      } else {
        _incrementQuantity(cartItem);
      }
    } else {
      _addNewProduct(product);
    }
    // if (_productItemList.contains(product)) {
    //   quantity++;
    // }
    // CartModel productItem = CartModel(product: product, quantity: quantity);
    // // title: product.title,
    // // price: product.price,
    // // image: product.image,
    // // id: product.id,
    // // description: product.description,
    // // category: product.category);

    // // List<Product> duplicList =
    // //     _productItemList.where((element) => element.id == product.id).toList();
    // // if (duplicList.isEmpty) {
    // // }
    // _productItemList.add(productItem);

    notifyListeners();
  }

  void _incrementQuantity(CartModel cartItem) {
    int _index = _productItemList.indexOf(cartItem);
    _productItemList[_index].quantity++;
  }

  void _decrementQuantity(CartModel cartItem) {
    int _index = _productItemList.indexOf(cartItem);
    _productItemList[_index].quantity--;
  }

  void _addNewProduct(Product product) {
    _productItemList.add(CartModel(product: product, quantity: 1));
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

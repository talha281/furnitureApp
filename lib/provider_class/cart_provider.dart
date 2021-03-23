import 'package:flutter/cupertino.dart';
import 'package:furniture_app/data/models/cart_model.dart';
import 'package:furniture_app/data/models/product.dart';

class Cart extends ChangeNotifier {
  List<CartModel?>? _productItemList = [];
  int  quantity = 1;
  

  addProductItem(Product product) {
    if (_productItemList!.isNotEmpty) {
      CartModel? cartItem = _productItemList?.firstWhere(
          (element) => element!.product!.id == product.id,
          orElse: () => _addNewProduct(product));
      int? index = _productItemList!.indexOf(cartItem!);
      if (cartItem != null) {
        _incrementQuantity(cartItem);
        _totalPricing(cartItem);
        print(_productItemList![index]!.totalPrice);
      }
    } else {
      _addNewProduct(product);
    }

    notifyListeners();
  }

  void _incrementQuantity(CartModel cartItem) {
    int _index = _productItemList!.indexOf(cartItem);
    _productItemList![_index]??quantity++;
  }

  void _totalPricing(CartModel cartItem) {
    int _index = _productItemList!.indexOf(cartItem);
    int _quantity = _productItemList![_index]!.quantity!;
    double _price = _productItemList![_index]!.product!.price!;
    double _totalPrice = _price * _quantity;
    _productItemList![_index]!.totalPrice = _totalPrice;
  }

  double grandTotalFunc() {
    double grandTotal = 0.0;
    _productItemList!.forEach((element) {
      grandTotal += element!.totalPrice!;
    });
    return grandTotal;
  }

  void _decrementQuantity(CartModel cartItem) {
    int _index = _productItemList!.indexOf(cartItem);
    double _price = _productItemList![_index]!.product!.price!;
    double _totalPrice = _productItemList![_index]!.totalPrice!;
    double _totalcost = _totalPrice - _price;
    _productItemList![_index]!.totalPrice = _totalcost;
    if (_productItemList![_index]!.quantity! <= 1) {
      removeProductItem(_productItemList![_index]!.product);
    } else {
      _productItemList![_index]??quantity--;
    }
  }

  _addNewProduct(Product product) {
    _productItemList!.add(CartModel(
        product: product, quantity: 1, totalPrice: product.price! * quantity));
  }

  removeItem(Product product) {
    CartModel? cartItem =
        _productItemList?.firstWhere((element) => element!.product == product);

    _decrementQuantity(cartItem!);
    notifyListeners();
  }

  removeProductItem(Product? product) {
    CartModel? cartItem =
        _productItemList?.firstWhere((element) => element!.product == product);
    _productItemList!.removeAt(_productItemList!.indexOf(cartItem));
    // duplicatesList.removeAt(duplicatesList.indexOf(product));
    notifyListeners();
    print(_productItemList);
  }

  List<CartModel?>? get productItemList {
    return _productItemList;
  }
}

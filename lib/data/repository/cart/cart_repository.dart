import 'package:furniture_app/data/models/cart_model.dart';
import 'package:furniture_app/data/models/product.dart';

import 'i_cart_repository.dart';

class CartRepository extends ICartRepository {
  //for  new project of mobile shop app
  //we will get list stored in perferences & convert that list of strings into list of model
  // on every time when we will call the functions of this repository then we will call one function with that function
  //In that function the code will be of converting that prefs list into model list.
  // And after working with models list we will make a function in which we will store list in preferences

  List<CartModel?> _productItemList = [];
  int quantity = 1;
  CartModel? cartProduct = CartModel(quantity: 0);

  addProductItem(Product? product) {
// we will get from prefs & add to list
    if (_productItemList.isNotEmpty) {
      CartModel? cartItem = _productItemList.firstWhere(
          (element) => element!.product!.id == product!.id,
          orElse: () => _addNewProduct(product!));
      int index = _productItemList.indexOf(cartItem);
      if (cartItem != null) {
        _incrementQuantity(cartItem);
        _totalPricing(cartItem);
// we will store to prefs again
        print(_productItemList[index]?.totalPrice);
      }
    } else {
      _addNewProduct(product!);
    }
  }

  _addNewProduct(Product product) {
    _productItemList.add(CartModel(
        product: product, quantity: 1, totalPrice: product.price! * quantity));
  }

  void _incrementQuantity(CartModel cartItem) {
    int? _index = _productItemList.indexOf(cartItem);
    _productItemList[_index]!.quantity++;
  }

  void _totalPricing(CartModel cartItem) {
    int _index = _productItemList.indexOf(cartItem);
    int _quantity = _productItemList[_index]!.quantity;
    double _price = _productItemList[_index]!.product!.price!;
    double _totalPrice = _price * _quantity;
    _productItemList[_index]!.totalPrice = _totalPrice;
  }

  double grandTotalFunc() {
    double grandTotal = 0.0;
    _productItemList.forEach((element) {
      grandTotal += element!.totalPrice!;
    });
    return (_productItemList.isEmpty) ? 0.0 : grandTotal;
  }

  removeItem(Product? product) {
    CartModel? cartItem =
        _productItemList.firstWhere((element) => element!.product == product);

    _decrementQuantity(cartItem!);
  }

  void _decrementQuantity(CartModel cartItem) {
    int? _index = _productItemList.indexOf(cartItem);
    double? _price = _productItemList[_index]!.product!.price;
    double? _totalPrice = _productItemList[_index]!.totalPrice;
    double? _totalcost = _totalPrice! - _price!;
    _productItemList[_index]!.totalPrice = _totalcost;
    if (_productItemList[_index]!.quantity <= 1) {
      removeProductItem(_productItemList[_index]!.product!);
    } else {
      _productItemList[_index]!.quantity--;
    }
  }

  removeProductItem(Product? product) {
    CartModel? cartItem =
        _productItemList.firstWhere((element) => element!.product == product);
    _productItemList.removeAt(_productItemList.indexOf(cartItem));
    print(_productItemList);
  }

  removeAllItem() {
    _productItemList.clear();
    print(_productItemList);
  }

  List<CartModel?>? get productItemList => _productItemList;

  dynamic checkTheCartFunc(Product? product) {
    CartModel? cartItem = productItemList!.firstWhere(
        (element) => element!.product!.id == product!.id, orElse: () {
      return cartProduct;
    });
    if (cartItem != null) {
      return cartItem;
    } else {
      return cartProduct;
    }
  }
}

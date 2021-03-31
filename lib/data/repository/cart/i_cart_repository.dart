import 'package:furniture_app/data/models/cart_model.dart';
import 'package:furniture_app/data/models/product.dart';

abstract class ICartRepository {
  List<CartModel?>? get productItemList;
  double grandTotalFunc();
  removeProductItem(Product? product);
  checkTheCartFunc(Product? product);
  removeItem(Product? product);
  addProductItem(Product? product);
}

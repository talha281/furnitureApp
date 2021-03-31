
import 'package:furniture_app/data/models/product.dart';

class CartModel {
  final Product? product;
  int quantity;
  double? totalPrice;

  CartModel({
    this.product,
    required this.quantity,
    this.totalPrice
  });

  CartModel copyWith({
    Product? product,
    int? quantity,
    double? totalPrice
  }) {
    return CartModel(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice ?? this.totalPrice
    );
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'product': product?.toMap(),
  //     'quantity': quantity,
  //   };
  // }

  // factory CartModel.fromMap(Map<String, dynamic> map) {
  //   if (map == null) return null;

  //   return CartModel(
  //     product: Product.fromMap(map['product']),
  //     quantity: map['quantity'],
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory CartModel.fromJson(String source) =>
  //     CartModel.fromMap(json.decode(source));

  @override
  String toString() => 'CartModel(product: $product, quantity: $quantity, totalPrice: $totalPrice)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CartModel && o.product == product && o.quantity == quantity && o.totalPrice == totalPrice;
  }

  @override
  int get hashCode => product.hashCode ^ quantity.hashCode ^ totalPrice.hashCode;
}

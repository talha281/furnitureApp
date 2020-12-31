import 'dart:convert';

import 'package:furniture_app/models/product.dart';

class CartModel {
  final Product product;
  int quantity;

  CartModel({
    this.product,
    this.quantity,
  });

  CartModel copyWith({
    Product product,
    int quantity,
  }) {
    return CartModel(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
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
  String toString() => 'CartModel(product: $product, quantity: $quantity)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CartModel && o.product == product && o.quantity == quantity;
  }

  @override
  int get hashCode => product.hashCode ^ quantity.hashCode;
}

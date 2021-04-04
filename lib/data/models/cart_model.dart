
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:furniture_app/data/models/product.dart';

class CartModel extends Equatable {

  final Product? product;
  int quantity;
  double? totalPrice;
  CartModel({
    this.product,
    required this.quantity,
    this.totalPrice,
  });

  

  CartModel copyWith({
    Product? product,
    int? quantity,
    double? totalPrice,
  }) {
    return CartModel(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'product': product?.toMap(),
      'quantity': quantity,
      'totalPrice': totalPrice,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      product: Product.fromMap(map['product']),
      quantity: map['quantity'],
      totalPrice: map['totalPrice'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) => CartModel.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [product, quantity, totalPrice];
}

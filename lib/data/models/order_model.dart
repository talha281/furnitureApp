import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:furniture_app/data/models/address_model.dart';
import 'package:furniture_app/data/models/cart_model.dart';

class OrderModel extends Equatable {
  final int? id;
  final double? grandTotal;
  final List<CartModel?>? productList;
  final DateTime orderDate;
  final AddressModel address;
  OrderModel({
    this.id,
    this.grandTotal,
    this.productList,
    required this.orderDate,
    required this.address,
  });

  OrderModel copyWith({
    int? id,
    double? grandTotal,
    List<CartModel?>? productList,
    DateTime? orderDate,
    AddressModel? address,
  }) {
    return OrderModel(
      id: id ?? this.id,
      grandTotal: grandTotal ?? this.grandTotal,
      productList: productList ?? this.productList,
      orderDate: orderDate ?? this.orderDate,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'grandTotal': grandTotal,
      'productList': productList?.map((x) => x?.toMap()).toList(),
      'orderDate': orderDate.millisecondsSinceEpoch,
      'address': address.toMap(),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'],
      grandTotal: map['grandTotal'],
      productList: List<CartModel?>.from(map['productList']?.map((x) => CartModel?.fromMap(x))),
      orderDate: DateTime.fromMillisecondsSinceEpoch(map['orderDate']),
      address: AddressModel.fromMap(map['address']),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) => OrderModel.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      grandTotal,
      productList,
      orderDate,
      address,
    ];
  }
}

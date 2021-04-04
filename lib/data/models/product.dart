import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:furniture_app/data/models/category.dart';

class Product extends Equatable {
  final int? id;
  final double? price;
  final String? title;
  final String? description;
  final String? image;
  final Category? category;

  Product({
    this.id,
    this.price,
    this.title,
    this.description,
    this.image,
    this.category,
  });

  Product copyWith({
    int? id,
    double? price,
    String? title,
    String? description,
    String? image,
    Category? category,
  }) {
    return Product(
      id: id ?? this.id,
      price: price ?? this.price,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'price': price,
      'title': title,
      'description': description,
      'image': image,
      'category': category?.toMap(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      price: map['price'],
      title: map['title'],
      description: map['description'],
      image: map['image'],
      category: Category.fromMap(map['category']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      price,
      title,
      description,
      image,
      category,
    ];
  }
}

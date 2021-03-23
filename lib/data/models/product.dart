import 'package:furniture_app/data/models/category.dart';

class Product {
  final int? id;
  final double? price;
  final String? title;
  final String? description;
  final String? image;
  final Category? category;

  Product({this.id, this.price, this.title, this.description, this.image, this.category});
  
}

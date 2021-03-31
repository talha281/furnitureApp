import 'package:furniture_app/data/models/category.dart';
import 'package:furniture_app/data/models/product.dart';

abstract class IHome{
  Future<List<Product>> func(String? catId);
  Future<List<Category>> get categories;
  Future<List<Product>> get products;

}
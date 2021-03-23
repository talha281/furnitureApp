import 'package:furniture_app/data/models/category.dart';

class MockCategories {
 static List<Category> _categories = [
    Category('All', 'AC'),
    Category('Sofa', 'SC'),
    Category('Stool Chair', 'STC'),
    Category('Arm Chair', 'ACC'),
    Category('Recliner', 'RC'),
  ];
  static List<Category> get categories => _categories;
}

import 'package:furniture_app/data/models/category.dart';
import 'package:furniture_app/data/models/product.dart';

class MockProducts {
  static List<Product> _products = [
    Product(
      id: 1,
      price: 1556.00,
      title: "Classic Leather Arm Chair",
      image: "assets/images/Item_1.png",
      category: Category('All', 'AC'),
      description: "Classic Leather Arm Chair comfort summons you here",
    ),
    Product(
      id: 2,
      price: 1668.00,
      title: "Poppy Plastic Tub Chair",
      image: "assets/images/Item_2.png",
      category: Category('Sofa', 'SC'),
      description: "Poppy Plastic Tub Chair comfort summons you here",
    ),
    Product(
      id: 3,
      price: 1499.00,
      title: "Bar Stool Chair",
      image: "assets/images/Item_3.png",
      category: Category('Stool Chair', 'STC'),
      description: "Bar Stool Chair comfort summons you here",
    ),
    Product(
      id: 4,
      price: 1399.00,
      title: "Dark Brown Color Recliner",
      image: "assets/images/recliner.png",
      category: Category('Recliner', 'RC'),
      description: "Dark Brown Color Recliner comfort summons you here",
    ),
    Product(
      id: 5,
      price: 1299.00,
      title: "Brown Color Recliner",
      image: "assets/images/recliner2.png",
      category: Category('Recliner', 'RC'),
      description: "Brown Color Recliner comfort summons you here",
    ),
    Product(
      id: 6,
      price: 1299.00,
      title: "Extra-Comfort Recliner",
      image: "assets/images/recliner3.png",
      category: Category('Recliner', 'RC'),
      description: "Extra-Comfort Recliner comfort summons you here",
    ),
    Product(
      id: 7,
      price: 999.00,
      title: "4-Sitter Park Bench",
      image: "assets/images/4-sitter-Park-Bench.png",
      category: Category('Park Bench', 'PBC'),
      description: "4-Sitter Park Bench comfort summons you here",
    ),
    Product(
      id: 8,
      price: 1499.00,
      title: "Black Park Bench",
      image: "assets/images/Black-Park-Bench.png",
      category: Category('Park Bench', 'PBC'),
      description: "Black Park Bench comfort summons you here",
    ),
    Product(
      id: 9,
      price: 1439.00,
      title: "Brown Park Bench",
      image: "assets/images/Brown-Park-Bench.png",
      category: Category('Park Bench', 'PBC'),
      description: "Brown Park Bench comfort summons you here",
    ),
    Product(
      id: 10,
      price: 1339.00,
      title: "Classy Arm Chair",
      image: "assets/images/classy-armchair.png",
      category: Category('Arm Chair', 'ACC'),
      description: "Classy Arm Chair comfort summons you here",
    ),
    Product(
      id: 11,
      price: 1225.39,
      title: "Green Texture Chair",
      image: "assets/images/greentext-armchair.png",
      category: Category('Arm Chair', 'ACC'),
      description: "Green Texture Chair comfort summons you here",
    ),
    Product(
      id: 12,
      price: 1239.00,
      title: "Royal Texture Chair",
      image: "assets/images/royal-text.png",
      category: Category('Arm Chair', 'ACC'),
      description: "Royal Texture Chair comfort summons you here",
    ),
  ];

  static List<Product> get products => _products;
}

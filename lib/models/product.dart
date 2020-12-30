import 'package:furniture_app/models/category.dart';

class Product {
  final int id, price;
  final String title, description, image;
  final Category category;

  Product(
      {this.id,
      this.price,
      this.title,
      this.description,
      this.image,
      this.category});
}

// list of products
// for our demo
List<Product> products = [
  Product(
    id: 1,
    price: 56,
    title: "Classic Leather Arm Chair",
    image: "assets/images/Item_1.png",
    category: Category('All', 'AC'),
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 2,
    price: 68,
    title: "Poppy Plastic Tub Chair",
    image: "assets/images/Item_2.png",
    category: Category('Sofa', 'SC'),
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 3,
    price: 39,
    title: "Bar Stool Chair",
    image: "assets/images/Item_3.png",
    category: Category('Stool Chair', 'STC'),
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 4,
    price: 39,
    title: "Dark Brown Color Recliner",
    image: "assets/images/recliner.png",
    category: Category('Recliner', 'RC'),
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 5,
    price: 39,
    title: "Brown Color Recliner",
    image: "assets/images/recliner2.png",
    category: Category('Recliner', 'RC'),
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 6,
    price: 39,
    title: "Extra-Comfort Recliner",
    image: "assets/images/recliner3.png",
    category: Category('Recliner', 'RC'),
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 7,
    price: 39,
    title: "4-Sitter Park Bench",
    image: "assets/images/4-sitter-Park-Bench.png",
    category: Category('Park Bench', 'PBC'),
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 8,
    price: 39,
    title: "Black Park Bench",
    image: "assets/images/Black-Park-Bench.png",
    category: Category('Park Bench', 'PBC'),
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 9,
    price: 39,
    title: "Brown Park Bench",
    image: "assets/images/Brown-Park-Bench.png",
    category: Category('Park Bench', 'PBC'),
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 10,
    price: 39,
    title: "Classy Arm Chair",
    image: "assets/images/classy-armchair.png",
    category: Category('Arm Chair', 'ACC'),
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 11,
    price: 39,
    title: "Green Texture Chair",
    image: "assets/images/greentext-armchair.png",
    category: Category('Arm Chair', 'ACC'),
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 12,
    price: 39,
    title: "Royal Texture Chair",
    image: "assets/images/royal-text.png",
    category: Category('Arm Chair', 'ACC'),
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
];

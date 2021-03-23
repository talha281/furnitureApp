import 'package:furniture_app/data/mock/mock_categories.dart';
import 'package:furniture_app/data/mock/mock_products.dart';
import 'package:furniture_app/data/models/category.dart';
import 'package:furniture_app/data/models/product.dart';

import 'interfaces/I_home.dart';

class HomeRepository implements IHome{
  Future<List<Product>> func(String? catId) async {
    if (catId != 'AC') {
      List<Product> prodList = await products.then((value) => value
          .where((element) => element.category!.categoryId == catId)
          .toList());
      // .where((element) => )
      // .toList();

      return prodList;
    } else {
      return products;
    }
  }

  Future<List<Category>> get categories async => MockCategories.categories;
  Future<List<Product>> get products async => MockProducts.products;
}

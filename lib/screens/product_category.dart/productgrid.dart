import 'package:flutter/material.dart';
import 'package:furniture_app/models/category.dart';
import 'package:furniture_app/screens/product_category.dart/particular.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          children: categories
              .map(
                (catData) => CategoryItem(catData.categoryName,catData.categoryId),
              )
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
      ),
    );
  }
}

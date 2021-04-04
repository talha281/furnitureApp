import 'dart:math';

import 'package:flutter/material.dart';
import 'package:furniture_app/Utils/navigator_class.dart';
import 'package:furniture_app/constants.dart';

import 'productsList.dart';

class CategoryItem extends StatelessWidget {
  final String? categoryName;
  final String? categoryId;
  CategoryItem(this.categoryName, this.categoryId);

  Color _bgColors = availableColors[Random().nextInt(3)];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigation.pushNavigation(
            context,
            ProductClass(
              categoryName: categoryName,
              categoryId: categoryId,
            ));
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
            child: Text(
          categoryName!,
          style: TextStyle(
              fontSize: 18, fontFamily: 'RobotoCondensed', color: Colors.white),
        )),
        decoration: BoxDecoration(
          color: _bgColors,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

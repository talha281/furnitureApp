import 'package:flutter/material.dart';
import 'package:furniture_app/data/mock/mock_categories.dart';
import '../../../constants.dart';

// We need statefull widget because we are gonna change some state on our category
class CategoryList extends StatelessWidget {
  final int? index;
  final int? selectedIndex;

  CategoryList({ this.index, this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        // At end item it add extra 20 right  padding
        right: index == MockCategories.categories.length - 1 ? kDefaultPadding : 0,
      ),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      decoration: BoxDecoration(
        color: index == selectedIndex
            ? Colors.white.withOpacity(0.4)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        MockCategories.categories[index!].categoryName!,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

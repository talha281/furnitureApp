import 'package:flutter/material.dart';
import 'package:furniture_app/data/models/product.dart';
import 'package:furniture_app/ui/category_product.dart/productgrid.dart';
import 'package:furniture_app/ui/dashboard/dashboard.dart';
import 'package:furniture_app/ui/dashboard/widgets/search_field.dart';
import 'package:page_transition/page_transition.dart';

import 'ui/details/details_screen.dart';

class RouteNavigation {
  static GlobalKey<NavigatorState> routeKey = GlobalKey<NavigatorState>();
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    final _duration = Duration(milliseconds: 250);
    final _reverseDuration = Duration(milliseconds: 200);

    PageTransition pageTransition({required Widget child, required PageTransitionType type}) {
      return PageTransition(
          child: child,
          type: type,
          duration: _duration,
          reverseDuration: _reverseDuration,
          settings: routeSettings,
          curve: Curves.easeInCubic);
    }

    switch (routeSettings.name) {
      case (RouteStrings.Home):
        return pageTransition(
            child: Dashboard(), type: PageTransitionType.rightToLeft);
      case (RouteStrings.Categories):
        return pageTransition(
            child: CategoriesScreen(), type: PageTransitionType.leftToRight);
      // case (RouteStrings.ChooseAddressScreen):
      //   return pageTransition(
      //       child: ChooseAddress(), type: PageTransitionType.bottomToTop);
      case (RouteStrings.ProductPage):
        return pageTransition(
            child: DetailsScreen(product: routeSettings.arguments as Product?),
            type: PageTransitionType.fade);
      case (RouteStrings.SearchBar):
        return pageTransition(
            child: SearchData(), type: PageTransitionType.fade);
      default:
        return pageTransition(
            child: Dashboard(), type: PageTransitionType.rotate);
    }
  }
}

class RouteStrings {
  static const Home = '/';
  static const ChooseAddressScreen = '/chooseAddress';
  static const AddAddressScreen = '/addAddress';
  static const Categories = '/categories';
  static const ProductPage = '/productPage';
  static const SearchBar = '/searchBar';
}

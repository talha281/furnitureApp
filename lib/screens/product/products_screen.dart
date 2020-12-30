import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/Utils/navigator_class.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/provider_class/provider_class.dart';
import 'package:furniture_app/screens/cart.dart';
import 'package:furniture_app/screens/product/appdrawer.dart';
import 'package:provider/provider.dart';

import 'components/body.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // var ccart = Provider.of<CartModel>(context);
    return Scaffold(
        appBar: buildAppBar(context),
        backgroundColor: kPrimaryColor,
        drawer: AppDrawer(),
        body: Body());
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text('Dashboard'),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset('assets/icons/cart_with_item.svg'),
          onPressed: () {
            Navigation.pushNavigation(context, CartScreen());
          },
        ),
      ],
    );
  }
}

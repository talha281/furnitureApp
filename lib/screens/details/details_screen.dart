import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/Utils/navigator_class.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/models/product.dart';
import 'package:furniture_app/provider_class/provider_class.dart';
import 'package:furniture_app/screens/cart.dart';
import 'package:provider/provider.dart';

import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  final int quantity;
  DetailsScreen({Key key, this.product, this.quantity}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: buildAppBar(context),
        body: DetailsBody(
          product: product,
          quantity: quantity,
        ));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        padding: EdgeInsets.only(left: kDefaultPadding),
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: false,
      title: Text(
        'Back'.toUpperCase(),
        style: Theme.of(context).textTheme.bodyText2,
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset('assets/icons/cart_with_item.svg'),
          onPressed: () {
            Navigation.pushNavigation(
                context,
                CartScreen(
                  quantity: quantity,
                ));
          },
        ),
      ],
    );
  }
}

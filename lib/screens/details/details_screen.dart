import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/blocs/cart/bloc/cart_bloc.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/data/models/product.dart';
import 'package:furniture_app/utils/navigator_class.dart';
import '../cart/cart.dart';
import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Product? product;
  final int? quantity;
  DetailsScreen({Key? key, this.product, this.quantity}) : super(key: key);
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
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            var ccart = BlocProvider.of<CartBloc>(context).cartRepository;
            return Stack(
              children: [
                IconButton(
                  icon: SvgPicture.asset('assets/icons/shopping-bag.svg',
                      color: Colors.black, height: 25),
                  onPressed: () {
                    Navigation.pushNavigation(
                        context,
                        CartScreen(
                          quantity: quantity,
                        ));
                  },
                ),
                (ccart.productItemList!.isNotEmpty)
                    ? Container(
                        padding: (ccart.productItemList!.length >= 10)
                            ? EdgeInsets.only(left: 18, top: 2)
                            : EdgeInsets.only(left: 21, top: 6, bottom: 8),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            ccart.productItemList!.length.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.4,
                                fontWeight: FontWeight.w700),
                          ),
                        ))
                    : Container(),
              ],
            );
          },
        ),
      ],
    );
  }
}

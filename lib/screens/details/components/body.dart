import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/Utils/quantity_manager.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/data/models/product.dart';
import 'package:furniture_app/screens/cart/bloc/cart_bloc.dart';
import 'product_image.dart';

class DetailsBody extends StatelessWidget {
  final Product? product;
  final int? quantity;
  DetailsBody({Key? key, this.product, this.quantity = 0});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CartBloc>(context).add(CheckTheCartEvent(product: product));
    var ccart = BlocProvider.of<CartBloc>(context).cartRepository;
    // it provide us total height and width
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small devices
    return SafeArea(
        bottom: false,
        child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          bool show = ((state is CartWithItem)
              ? (state.cartItem!.quantity == 0 ||
                      state.cartItem!.quantity == null)
                  ? false
                  : true
              : false);

          print(show);
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Hero(
                        tag: '${product!.id}',
                        child: ProductPoster(
                          size: size,
                          image: product!.image,
                        ),
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: kDefaultPadding / 2),
                        child: Text(
                          product!.title!,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Text(
                        '\$${product!.price}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: kSecondaryColor,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                        child: Text(
                          product!.description!,
                          style: TextStyle(color: kTextLightColor),
                        ),
                      ),
                      SizedBox(height: kDefaultPadding),
                    ],
                  ),
                ),
                Container(
                  height: 65,
                  margin: EdgeInsets.all(kDefaultPadding),
                  padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding,
                    vertical: kDefaultPadding / 2,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFFCBF1E),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: <Widget>[
                      SvgPicture.asset(
                        "assets/icons/chat.svg",
                        height: 18,
                        color: kPrimaryColor,
                      ),
                      SizedBox(width: kDefaultPadding / 2),
                      Text(
                        "Chat",
                        style: TextStyle(color: kPrimaryColor),
                      ),
                      // it will cover all available spaces
                      Spacer(),
                      (show)
                          ? QuantityManager(
                              padding: (state is CartWithItem)
                                  ? (state.cartItem!.quantity >= 10)
                                      ? EdgeInsets.only(left: 6.5, top: 5)
                                      : EdgeInsets.only(left: 9.5, top: 5)
                                  : EdgeInsets.only(left: 9.5, top: 5),
                              quantity: (state is CartWithItem)
                                  ? state.cartItem!.quantity
                                  : 0,
                              minusCallback: () {
                                BlocProvider.of<CartBloc>(context)
                                    .add(RemoveItemEvent(product: product));
                                // ccart.removeItem(cartItem.product);
                              },
                              plusCallback: () {
                                BlocProvider.of<CartBloc>(context)
                                    .add(AddProductEvent(product: product));
                                //ccart.addProductItem(cartItem.product);
                              },
                            )
                          : FlatButton.icon(
                              onPressed: () {
                                BlocProvider.of<CartBloc>(context)
                                    .add(AddProductEvent(
                                  product: product,
                                ));
                                //  ccart.addProductItem(widget.product);
                              },
                              icon: SvgPicture.asset(
                                "assets/icons/shopping-bag.svg",
                                height: 18,
                                color: kPrimaryColor,
                              ),
                              label: Text(
                                "Add to Cart",
                                style: TextStyle(color: kPrimaryColor),
                              ),
                            ),
                    ],
                  ),
                )
              ],
            ),
          );
        }));
  }
}

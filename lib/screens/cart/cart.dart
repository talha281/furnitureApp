import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/Utils/quantity_manager.dart';
import 'package:furniture_app/blocs/cart/bloc/cart_bloc.dart';
import 'package:furniture_app/constants.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key, this.quantity = 1}) : super(key: key);
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    var ccart = BlocProvider.of<CartBloc>(context).cartRepository;
    final productz = ccart.productItemList;
    print(productz);
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        bottomNavigationBar:
            BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          return (state is CartWithItem)
              ? BottomAppBar(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Container(
                    //height: 40,
                    height: 45,
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: RichText(
                              text: TextSpan(
                                  text: 'Total Price: ',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'RobotoCondensed',
                                      fontSize: 15),
                                  children: [
                                TextSpan(
                                  text:
                                      '₹${BlocProvider.of<CartBloc>(context).cartRepository.grandTotalFunc().toStringAsFixed(0)}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 21),
                                )
                              ])),
                        ),
                        VerticalDivider(
                          color: kPrimaryColor,
                          thickness: 1.5,
                          width: 0,
                        ),
                        Center(
                          child: Text(
                            'Proceed to Pay',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : BottomAppBar(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Container(
                    height: 45,
                  ));
        }),
        backgroundColor: kPrimaryColor,
        body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          return (state is CartEmpty)
              ? Center(
                  child: Text(
                    emptyCartText,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )
              : Stack(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: productz!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 8, left: 12, right: 12),
                            child: Stack(
                              children: [
                                Container(
                                  height: 180,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: Colors.grey.shade300,
                                    boxShadow: [kDefaultShadow],
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    margin: EdgeInsets.only(right: 6, top: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8, left: 5, right: 3),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  height: 105,
                                                  width: 110,
                                                  child: Image.asset(
                                                    productz[index]!
                                                        .product!
                                                        .image!,
                                                    fit: BoxFit.cover,
                                                  )),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 12),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2.2,
                                                      child: Text(
                                                        productz[index]!
                                                            .product!
                                                            .title!,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 4,
                                                              top: 4),
                                                      child: Text(
                                                        productz[index]!
                                                            .product!
                                                            .category!
                                                            .categoryName!,
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 18),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              4.5),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            2.97,
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                              "₹${productz[index]!.product!.price.toString()}",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .amber,
                                                                  fontSize: 32),
                                                            ),
                                                            Center(
                                                              child:
                                                                  QuantityManager(
                                                                padding: (productz[index]!
                                                                            .quantity >=
                                                                        10)
                                                                    ? EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            6.5,
                                                                        top: 7,
                                                                      )
                                                                    : EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            9.5,
                                                                        top: 7,
                                                                      ),
                                                                quantity: productz[
                                                                        index]!
                                                                    .quantity,
                                                                minusCallback:
                                                                    () {
                                                                  BlocProvider.of<
                                                                              CartBloc>(
                                                                          context)
                                                                      .add(RemoveItemEvent(
                                                                          product:
                                                                              productz[index]!.product));
                                                                },
                                                                plusCallback:
                                                                    () {
                                                                  BlocProvider.of<
                                                                              CartBloc>(
                                                                          context)
                                                                      .add(AddProductEvent(
                                                                          product:
                                                                              productz[index]!.product));
                                                                },
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 8),
                                                              child: Container(
                                                                child: Row(
                                                                  children: [
                                                                    Text(
                                                                        "Total Amount: "),
                                                                    Text(
                                                                      "₹${productz[index]!.totalPrice!.toStringAsFixed(0)}",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .amber,
                                                                          fontSize:
                                                                              18),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 1, top: 5),
                                  child: Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        height: 35,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey.shade300),
                                        child: IconButton(
                                          iconSize: 20,
                                          icon: Icon(Icons.clear),
                                          onPressed: () {
                                            BlocProvider.of<CartBloc>(context)
                                                .add(RemoveProductEvent(
                                                    product: productz[index]!
                                                        .product));
                                          },
                                        ),
                                      )),
                                )
                              ],
                            ),
                          );
                        }),
                  ],
                );
        }));
  }
}

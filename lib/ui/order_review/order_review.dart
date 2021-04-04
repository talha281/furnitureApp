import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/blocs/cart/bloc/cart_bloc.dart';
import 'package:furniture_app/data/models/address_model.dart';
import 'package:furniture_app/data/models/cart_model.dart';
import 'package:furniture_app/data/models/order_model.dart';
import 'package:furniture_app/data/repository/cart/cart_repository.dart';
import 'package:furniture_app/ui/order_confirmed/order_confirmed.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderReview extends StatefulWidget {
  final List<CartModel?>? cartList;

  final double? grandTotal;

  OrderReview({this.cartList, this.grandTotal});

  @override
  _OrderReviewState createState() => _OrderReviewState();
}

class _OrderReviewState extends State<OrderReview> {
  CartRepository cartRepository = CartRepository();
  AddressModel selectedAdddress = AddressModel();
  AddressModel address = AddressModel();
  List<AddressModel> addresses = [];
  int _addressRadio = -1;
  int orderId = 0;
  int totalCost = 0;

  clearSelectedAddress() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("currentAddress");
    setState(() {
      selectedAdddress = AddressModel();
    });
  }

  Future<int?> _getSelectedAddress() async {
    final prefs = await SharedPreferences.getInstance();
    var individualAddress = prefs.getString("currentAddress");

    AddressModel add = AddressModel.fromJson(individualAddress!);

    return add.id;
  }

  _getAddresses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<AddressModel> addressList = [];
    List<String>? getStoredList = prefs.getStringList('AddressList');
    if (getStoredList != null) {
      getStoredList.forEach((element) {
        addressList.add(AddressModel.fromJson(element));
      });
    }
    print('this is $getStoredList');
    setState(() {
      addresses = addressList;
    });

    int? aid = await _getSelectedAddress();
    setState(() {
      _addressRadio = addresses
          .indexOf(addresses.firstWhere((element) => element.id == aid));
    });
  }

  Future<void> orderCheckout(
      int id, double grandTotal, List<CartModel?>? productList) async {
    print("this is product listy $productList");

    OrderModel order = OrderModel(
        id: id,
        grandTotal: grandTotal,
        productList: productList,
        orderDate: DateTime.now(),
        address: addresses[_addressRadio]);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<OrderModel>? ordersList = [];
    List<String>? getStoredList = prefs.getStringList('OrdersList') ?? [];
    if (getStoredList.isNotEmpty) {
      getStoredList.forEach((element) {
        ordersList.add(OrderModel.fromJson(element));
      });
    }
    ordersList.add(order);

    print('this is address list $ordersList');

    List<String>? setStringList = [];
    ordersList.forEach((element) {
      setStringList.add(element.toJson());
    });
    prefs.setStringList('OrdersList', setStringList);

    BlocProvider.of<CartBloc>(context).add(RemoveAllItem());

    print('this is deleted product list ${cartRepository.productItemList}');

    Navigator.pushReplacement(
      context,
      PageTransition(
        child: OrderConfirm(id: id),
        type: PageTransitionType.rightToLeftWithFade,
      ),
    );
  }

  Future<int> generatedOrderId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? storedId = prefs.getInt('orderId');

    if (storedId != null) {
      int idToPrefs = storedId + 1;
      //prefs.remove('productId');

      prefs.setInt('orderId', idToPrefs);
      return idToPrefs;
    } else {
      prefs.setInt('orderId', 1);
      return 1;
    }
  }

  @override
  void initState() {
    super.initState();

    _getAddresses();
    _getSelectedAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Summary'),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            bottom: 10,
          ),
          child: Container(
              height: 50,
              width: double.infinity,
              child: MaterialButton(
                disabledTextColor: Colors.grey,
                disabledColor: Theme.of(context).primaryColor.withOpacity(0.5),
                color: Theme.of(context).primaryColor,
                elevation: 4,
                hoverElevation: 20,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
                onPressed: (addresses.length != 0 && _addressRadio != -1)
                    ? () async {
                        print('hi');
                        int id = await generatedOrderId();
                        orderCheckout(id, widget.grandTotal!, widget.cartList);
                      }
                    : null,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'CheckOut',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 15, bottom: 5),
                  child: Text(
                    'Confirm your order'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).primaryColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              CustomDivider(),
              Padding(
                padding: EdgeInsets.all(7),
              ),
              Container(
                padding: EdgeInsets.only(left: 12),
                child: Text(
                  'Order Details'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFFCBF1E), width: 1),
                      borderRadius: BorderRadius.circular(6)),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 1.0, bottom: 8, left: 15),
                            child: Text('Orders',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Text(
                              'Total Price',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      CustomDivider(),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: widget.cartList!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              child: ListTile(
                                title: Text(
                                    widget.cartList![index]!.product!.title!),
                                subtitle: Text(
                                    '${widget.cartList![index]!.quantity} X ${widget.cartList![index]!.product!.price}'),
                                trailing: Text(
                                    "₹${widget.cartList![index]!.totalPrice.toString()}"),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomDivider(),
              DetailTextAndAmount(
                textTitle: 'Subtotal',
                fontSize: 25,
                fontWeight: FontWeight.w400,
                amount: '₹${widget.grandTotal!.toStringAsFixed(1)}',
                amountFontSize: 20,
                amountFontWeight: FontWeight.w400,
                height: 30,
              ),
              CustomDivider(),
              SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: Text(
                          'Only COD Available, you have to pay cash on delivery')),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 1),
                child: Text(
                  'Choose Address'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              (addresses.length != 0 || addresses.length > 0)
                  ? Padding(
                      padding: EdgeInsets.only(
                          top: 8, left: 12, right: 12, bottom: 12),
                      child: Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Color(0xFFFCBF1E), width: 1),
                            borderRadius: BorderRadius.circular(6)),
                        child: Column(
                          children: [
                            ListView.builder(
                              itemCount: addresses.length,
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (c, index) {
                                return Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width /
                                              28,
                                      vertical: 2),
                                  child: RadioListTile(
                                    groupValue: _addressRadio,
                                    value: index,
                                    dense: true,
                                    title: Text(
                                        '${addresses[index].userName}|${addresses[index].mobileNumber}',
                                        style: TextStyle(
                                            fontFamily: 'Ubuntu',
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal,
                                            color: Theme.of(context)
                                                .primaryColor)),
                                    subtitle: Text(
                                        "${addresses[index].deliveryAddress}\t${addresses[index].deliveryArea}\t${addresses[index].landMark}\t${addresses[index].city}\t${addresses[index].pinCode}",
                                        style: TextStyle(
                                            fontFamily: 'Ubuntu',
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal)),
                                    onChanged: (_) {
                                      setState(() {
                                        _addressRadio = index;
                                      });
                                    },
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  : Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: Text(
                          'No address available please select address first.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.4)),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

//this is for the details screen i.e amount and title...

class DetailTextAndAmount extends StatelessWidget {
  DetailTextAndAmount({
    required this.height,
    required this.textTitle,
    required this.fontSize,
    required this.amount,
    required this.amountFontSize,
    required this.amountFontWeight,
    required this.fontWeight,
  });
  final double height;
  final String textTitle;
  final double fontSize;
  final String amount;
  final double amountFontSize;
  final FontWeight fontWeight;
  final FontWeight amountFontWeight;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
        ),
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              textTitle,
              style: TextStyle(fontSize: fontSize),
            ),
            Text(
              amount,
              style: TextStyle(fontSize: fontSize),
            )
          ],
        ));
  }
}

//it shows the horizontal thin line between two widgets...
class CustomDivider extends StatelessWidget {
  final double height;

  CustomDivider({
    this.height = 10,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      child: Divider(
        color: Color(0xFFFCBF1E),
        height: height,
      ),
    );
  }
}

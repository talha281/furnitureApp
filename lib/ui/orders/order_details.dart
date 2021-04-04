import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/data/models/order_model.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderDetailsScreen extends StatefulWidget {
  final OrderModel? order;
  OrderDetailsScreen({this.order});

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  //late OrderModel order;
  // _cancelItem(int orderDetailId) async {
  //   String uid = await checkLogin().then((value) => value.uID);
  //   await ApiCalls().cancelItem(uid, orderDetailId, context);
  // }

  _cancelOrder(OrderModel order) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.remove('OrdersList');
    List<OrderModel>? ordersList = [];
    List<String>? getStoredList = prefs.getStringList('OrdersList') ?? [];
    if (getStoredList.isNotEmpty) {
      getStoredList.forEach((element) {
        ordersList.add(OrderModel.fromJson(element));
      });
    }
    OrderModel orderM = ordersList.firstWhere((element) => element == order);
    int index = ordersList.indexOf(orderM);
    ordersList.removeAt(index);

    List<String>? setStringList = [];
    ordersList.forEach((element) {
      setStringList.add(element.toJson());
    });
    prefs.setStringList('OrdersList', setStringList);
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pop(context);
    // String uid = await checkLogin().then((value) => value.uID);
    // await apiCall.cancelOrder(uid, orderId, context);
  }

  String dateOnly(DateTime date) {
    var dateFormat = DateFormat.yMMMMd('en_US');
    print(dateFormat.format(date));
    return dateFormat.format(date);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Order Details')),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18, top: 15, bottom: 3),
                child: Text(
                  'Order Details',
                  style: TextStyle(
                      fontSize: 20,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 8, left: 18, right: 18, bottom: 5),
                child: Container(
                  padding:
                      EdgeInsets.only(left: 18, right: 13, top: 10, bottom: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFFCBF1E), width: 1),
                      borderRadius: BorderRadius.circular(6)),
                  // height: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 44),
                            child: Text(
                              'Order ID',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: kPrimaryColor.withOpacity(0.9),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Text(
                            "#${widget.order!.id.toString()}",
                            style: TextStyle(
                                fontSize: 16,
                                color: kPrimaryColor.withOpacity(0.9),
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 25),
                            child: Text(
                              'Order Date',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: kPrimaryColor.withOpacity(0.9),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Text(
                            dateOnly(widget.order!.orderDate),
                            style: TextStyle(
                                fontSize: 16,
                                color: kPrimaryColor.withOpacity(0.9),
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 19, top: 10, bottom: 2),
                        child: Text(
                          'Shipment Details',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Ubuntu',
                              color: kPrimaryColor,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      (widget.order!.productList!.length > 0)
                          ? ListView.builder(
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: widget.order!.productList!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      top: 5, left: 3, right: 3, bottom: 8),
                                  child: Container(
                                    padding: EdgeInsets.only(top: 3),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.5)),
                                    child: Column(
                                      children: [
                                        Material(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.5)),
                                          elevation: 2,
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          child: Column(
                                            children: [
                                              Container(
                                                // height: 200,
                                                padding: EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    top: 13,
                                                    bottom: 0.1),
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    //color: theme.textWhite.withOpacity(0.4),
                                                    border: Border.all(
                                                        color:
                                                            Color(0xFFFCBF1E),
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        FittedBox(
                                                          fit: BoxFit.contain,
                                                          child: Container(
                                                            width: 150,
                                                            child: Text(
                                                                '${widget.order!.productList![index]!.product!.title}',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontFamily:
                                                                        'Ubuntu',
                                                                    color:
                                                                        kPrimaryColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal)),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 10),
                                                          child: RichText(
                                                            text: TextSpan(
                                                                text: '₹',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    fontFamily:
                                                                        'Ubuntu',
                                                                    color: Color(
                                                                        0xFFFCBF1E),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal),
                                                                children: [
                                                                  TextSpan(
                                                                      text:
                                                                          '${widget.order!.productList![index]!.product!.price}',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              13,
                                                                          fontFamily:
                                                                              'Ubuntu',
                                                                          color: Color(
                                                                              0xFFFCBF1E),
                                                                          fontWeight:
                                                                              FontWeight.w600))
                                                                ]),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                            '${widget.order!.productList![index]!.product!.category!.categoryName}',
                                                            style: TextStyle(
                                                                fontSize: 10.5,
                                                                fontFamily:
                                                                    'Ubuntu',
                                                                color:
                                                                    kPrimaryColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 10),
                                                          child: RichText(
                                                            text: TextSpan(
                                                                text: "quantity: "
                                                                    .toUpperCase(),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        9.5,
                                                                    fontFamily:
                                                                        'Ubuntu',
                                                                    color: kPrimaryColor
                                                                        .withOpacity(
                                                                            0.7),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal),
                                                                children: [
                                                                  TextSpan(
                                                                      text:
                                                                          '${widget.order!.productList![index]!.quantity}',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              11,
                                                                          fontFamily:
                                                                              'Ubuntu',
                                                                          color:
                                                                              kPrimaryColor,
                                                                          fontWeight:
                                                                              FontWeight.w600))
                                                                ]),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 12,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                          : Padding(
                              padding: EdgeInsets.only(
                                  top: 5, left: 17, right: 17, bottom: 8),
                              child: Container(
                                padding: EdgeInsets.only(top: 3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.5)),
                                child: Material(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.5)),
                                    elevation: 4,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Container(
                                        height: 50,
                                        padding: EdgeInsets.only(
                                            left: 18,
                                            right: 13,
                                            top: 13,
                                            bottom: 2),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            //color: theme.textWhite.withOpacity(0.4),
                                            border: Border.all(
                                                color: Color(0xFFFCBF1E),
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: Text(
                                            'We are processing your order'))),
                              ),
                            ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 19, top: 15, bottom: 2),
                        child: Text(
                          'Shipping Address',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Ubuntu',
                              color: kPrimaryColor,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 4, left: 1, right: 1, bottom: 5),
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 2, right: 2, top: 10, bottom: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xFFFCBF1E), width: 1),
                              borderRadius: BorderRadius.circular(6)),
                          child: (widget.order!.address.userName!.isEmpty)
                              ? Container(
                                  child: Text(
                                      'There is no address against this order yet.'),
                                )
                              : ListTile(
                                  title: Text(
                                      '${widget.order!.address.userName}|${widget.order!.address.mobileNumber}',
                                      style: TextStyle(
                                          fontFamily: 'Ubuntu',
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                          color:
                                              Theme.of(context).primaryColor)),
                                  subtitle: Text(
                                      "${widget.order!.address.deliveryAddress}\t${widget.order!.address.deliveryArea}\t${widget.order!.address.pinCode}",
                                      style: TextStyle(
                                          fontFamily: 'Ubuntu',
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal)),
                                ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                          '*Your Order Request is recorded, we will contact you in coming 3 days.*\n *In case your order is not recieved please contact us from Contact Us section in the app*',
                          style: TextStyle(color: Colors.amber.shade700)),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 19, top: 13, bottom: 2),
                        child: Text(
                          'Order Summary',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Ubuntu',
                              color: kPrimaryColor,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Order Total: ",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.normal)),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                                "₹${widget.order!.grandTotal.toString()}",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFFFCBF1E),
                                    fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 80.0, right: 80, top: 12, bottom: 20),
                  child: Container(
                      height: 50,
                      width: double.infinity,
                      child: MaterialButton(
                        disabledTextColor: Colors.grey,
                        disabledColor:
                            Theme.of(context).primaryColor.withOpacity(0.5),
                        color: Theme.of(context).primaryColor,
                        elevation: 4,
                        hoverElevation: 20,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0)),
                        onPressed: () async {
                          _cancelOrder(widget.order!);
                          //login butoon function
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Cancel Order'.toUpperCase(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )),
                ),
              )
            ],
          ),
        ));
  }
}

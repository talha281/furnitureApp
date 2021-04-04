import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_app/blocs/dashboard/bloc/dashboard_bloc.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/ui/dashboard/dashboard.dart';
import 'package:furniture_app/ui/orders/orders.dart';
import 'package:page_transition/page_transition.dart';

class OrderConfirm extends StatelessWidget {
  final int? id;
  OrderConfirm({this.id});
  final Shader linearGradient = LinearGradient(
    colors: <Color>[
      kPrimaryColor,
      Color(0xFFFCBF1E),
    ],
  ).createShader(Rect.fromLTWH(20.0, 20.0, 500.0, 100.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 50.0, left: 0, right: 0, bottom: 128),
        child: Container(
          padding: EdgeInsets.only(bottom: 68, top: 8),
          child: Container(
            height: 320,
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            padding: EdgeInsets.only(top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                Center(
                  child: Icon(
                    FontAwesomeIcons.checkCircle,
                    size: 50.0,
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    'Your order has been confirmed',
                    style: TextStyle(fontSize: 18, color: kPrimaryColor),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Text(
                    'Order ID  #$id'.toUpperCase(),
                    style: TextStyle(fontSize: 16, color: Color(0xFFFCBF1E)),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(
                    'You can view it in the My orders Section',
                    style: TextStyle(fontSize: 14, color: Color(0xFFFCBF1E)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                      );
                    },
                    child: Text('HOME',
                        style: TextStyle(color: kPrimaryColor, fontSize: 15))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

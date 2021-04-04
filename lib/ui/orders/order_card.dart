import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/data/models/order_model.dart';
import 'package:furniture_app/ui/orders/order_details.dart';
import 'package:page_transition/page_transition.dart';

class OrderCard extends StatelessWidget {
  final OrderModel? order;

  const OrderCard({this.order});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, right: 10, left: 8),
      child: Container(
        width: double.infinity,
        height: 65,
        padding: EdgeInsets.only(left: 14, top: 4),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Material(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.5)),
          elevation: 3,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  child: OrderDetailsScreen(
                    order: order,
                  ),
                  type: PageTransitionType.rightToLeftWithFade,
                ),
              );
            },
            leading: Container(
              decoration: BoxDecoration(
                color: Color(0xFFFCBF1E),
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.transparent,
                child: CircleAvatar(
                  radius: 18.2,
                  backgroundColor: Colors.white,
                  child: Text(
                    order!.productList!.length.toString(),
                    style: TextStyle(fontSize: 16, color: kPrimaryColor),
                  ),
                ),
              ),
            ),
            title: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "ORDER #${order!.id.toString()}",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: kPrimaryColor),
              ),
            ),
            trailing: Icon(
              FontAwesomeIcons.chevronRight,
              size: 20,
              color: Color(0xFFFCBF1E),
            ),
          ),
        ),
      ),
    );
  }
}

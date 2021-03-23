import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_app/constants.dart';

class QuantityManager extends StatelessWidget {
  final int? quantity;
  final VoidCallback? plusCallback;
  final VoidCallback? minusCallback;
  final double? iconSize;
  final EdgeInsetsGeometry? padding;

  QuantityManager(
      {this.quantity,
      this.iconSize,
      this.padding,
      this.plusCallback,
      this.minusCallback});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        color: Color(0xFFFCBF1E),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          //bottomRight: Radius.circular(38),
        ),
      ),
      height: 35,
      // width: 105,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              icon: Icon(FontAwesomeIcons.minus),
              iconSize: 14,
              color: kPrimaryColor,
              onPressed: minusCallback),
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 4),
                child: (SvgPicture.asset("assets/icons/shopping-bag.svg",
                    height: 25,color: kPrimaryColor)),
              ),
              Container(
                  padding: padding,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '$quantity',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                  )),
            ],
          ),
          IconButton(
              icon: Icon(FontAwesomeIcons.plus),
              iconSize: 12,
              color: kPrimaryColor,
              onPressed: plusCallback)
        ],
      ),
    );
  }
}

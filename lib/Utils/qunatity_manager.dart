import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QuantityManager extends StatelessWidget {
  final int quantity;
  final VoidCallback plusCallback;
  final VoidCallback minusCallback;
  final double iconSize;
  final EdgeInsetsGeometry padding;

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
      // width: 105,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              icon: Icon(FontAwesomeIcons.minusCircle),
              color: Colors.black,
              onPressed: minusCallback),
          Container(
              padding: padding,
              child: Text(
                '$quantity',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              )),
          IconButton(
              icon: Icon(FontAwesomeIcons.plusCircle),
              color: Colors.black,
              onPressed: plusCallback)
        ],
      ),
    );
  }
}

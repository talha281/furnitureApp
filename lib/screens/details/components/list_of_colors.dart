import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'color_dots.dart';

class ListOfColors extends StatelessWidget {
  const ListOfColors({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ColorDot(
            fillColor: Color(0xFF80989A),
            isSelected: false,
          ),
          ColorDot(
            fillColor: Color(0xFFFF5200),
            isSelected: true,
          ),
          ColorDot(
            fillColor: kPrimaryColor,
            isSelected: false,
          ),
        ],
      ),
    );
  }
}

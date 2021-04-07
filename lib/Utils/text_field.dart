import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';

class TextInputField extends StatelessWidget {
  static const padding = EdgeInsets.symmetric(horizontal: 10, vertical: 6);
  TextInputField(
      {required this.controller,
      required this.hintText,
      this.icon,
      this.keyboard = TextInputType.text,
      this.contentPadding = padding,
      bool? readOnly});

  final String hintText;
  final IconData? icon;
  final TextInputType keyboard;
  final EdgeInsetsGeometry contentPadding;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 15, right: 15),
      height: 50,
      padding: EdgeInsets.only(left: 16, right: 20),
      decoration: BoxDecoration(
        color: kBackgroundColor,
        border: Border.all(color: kPrimaryColor, width: 1),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          //bottomRight: Radius.circular(38),
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(primaryColor: kPrimaryColor),
        child: TextFormField(
          style: TextStyle(),
          keyboardType: keyboard,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 17),
            contentPadding: padding,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

Widget submitButton(
  Function callback,
  BuildContext context,
  String text,
) {
  return GestureDetector(
    onTap: callback as void Function()?,
    child: Container(
      height: 45,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColor.withAlpha(190)
              ])),
      child: FittedBox(
        fit: BoxFit.none,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}

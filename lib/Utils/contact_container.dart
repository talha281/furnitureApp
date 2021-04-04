import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';

class ContactScrContainer extends StatelessWidget {
  static const EdgeInsetsGeometry marginD = EdgeInsets.only(
    top: 5,
    left: 20,
    right: 20,
    bottom: 5,
  );

  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;
  final IconData? icon;
  final Text? icontext;
  final Text? messageText;
  final Text? contactThrough;
  final Function()? callback;
  ContactScrContainer(
      {this.height,
      this.width,
      this.padding,
      this.margin = marginD,
      this.icon,
      this.icontext,
      this.messageText,
      this.contactThrough,
      @required this.callback});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.only(left: 6, top: 4, bottom: 2, right: 1),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [Colors.amber.shade700, kPrimaryColor],
          ),
          borderRadius: BorderRadius.circular(7)),
      child: Container(
        child: Material(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            elevation: 1,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
                margin: margin,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomRight,
                            colors: [Colors.amber.shade700, kPrimaryColor],
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.transparent,
                          child: CircleAvatar(
                            radius: 26.2,
                            backgroundColor: Colors.white,
                            child: Icon(
                              icon,
                              size: 28.0,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: icontext,
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: messageText,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: InkWell(onTap: callback, child: contactThrough),
                    ),
                  ],
                ))),
      ),
    );
  }
}

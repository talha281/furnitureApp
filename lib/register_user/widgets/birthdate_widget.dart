import 'package:flutter/material.dart';
import 'package:furniture_app/constants/paddings.dart';
class BirthDateWidget extends StatelessWidget {
  final String? fieldName;
  final Function? onTap;
  final String? birthDaytext;
  const BirthDateWidget({this.fieldName, this.onTap, this.birthDaytext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ConstPadding.t15r8b15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: ConstPadding.onlyl12,
            child: Text(fieldName!,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.5)),
          ),
          Align(
            //alignment: Alignment.bottomLeft,
            child: InkWell(
              onTap: onTap as void Function()?,
              child: Container(
                child: ConstrainedBox(
                    constraints:
                        BoxConstraints(maxHeight: 150.0, maxWidth: 180),
                    child: Text(birthDaytext!,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
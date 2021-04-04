
import 'package:flutter/material.dart';
import 'package:furniture_app/constants/paddings.dart';

class RadioWidget<T> extends StatelessWidget {
  final String title;
  final List<T> values;
  final T groupValue;
  final void Function(T?) onChanged;

  const RadioWidget(
      {Key? key,
      required this.values,
      required this.groupValue,
      required this.onChanged,
      required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 1.5;
    return Padding(
      padding: ConstPadding.t8r8b5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: ConstPadding.onlyl12,
            child: Text(title,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.5)),
          ),
          Container(
            height: 50,
            child: ListView.builder(
              itemCount: values.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (context, index) => Container(
                width: width / values.length,
                child: RadioListTile(
                  value: values[index],
                  groupValue: groupValue,
                  onChanged: onChanged,
                  title: Text(
                      values[index].toString().split('.')[1].toUpperCase(),
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
                ),
              ),
            ),
          ),

          //
        ],
      ),
    );
  }
}

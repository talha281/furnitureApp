import 'package:flutter/material.dart';
import 'package:furniture_app/own_packages/pin_entry_fields.dart';

class OtpInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          child: Padding(
            padding: EdgeInsets.only(left: 6, top: 48, right: 14, bottom: 16),
            // ConstPadding.l16t48r17b16,
            child: Column(
              children: <Widget>[
                Container(
                  height: 48,
                  width: double.infinity,
                  child: PinEntryTextField(
                      showFieldAsBox: true,
                      fields: 6,
                      onSubmit: (String pin) {
                        var smsCode = pin;

                        Navigator.pop(context, smsCode);
                      }),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Enter your One Time Password above',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          constraints: BoxConstraints.tight(Size.fromHeight(200)),
        ),
      ],
    );
  }
}

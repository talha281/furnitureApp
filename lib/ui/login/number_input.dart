import 'package:flutter/material.dart';
import 'package:furniture_app/global/widgets/circular_progress_indicator.dart';
import 'package:furniture_app/utils/buttons.dart';
import 'package:furniture_app/utils/phone_sign_in.dart';
import 'package:furniture_app/utils/textfields_Utils.dart';

class NumberInput extends StatefulWidget {
  @override
  _NumberInputState createState() => _NumberInputState();
}

class _NumberInputState extends State<NumberInput> with PhoneSignIn {
  final _formKey = GlobalKey<FormState>();

  final _phoneTextController = TextEditingController();

  Widget entryField(TextEditingController controller) {
    return Form(
      key: _formKey,
      child: EditTextUtils().getCustomEditTextArea(
          labelValue: "Enter phone number",
          controller: controller,
          keyboardType: TextInputType.number,
          icon: Icons.phone,
          validator: (value) {
            //return validatePhone(value);
          }),
    );
  }

  String? validateMobile(String value) {
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // SizedBox(height: height * .3),
        entryField(_phoneTextController),
        SizedBox(
          height: 12,
        ),
        FittedBox(
          fit: BoxFit.contain,
          child: submitButton(() async {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return Container(
                    color: Colors.white10,
                    height: 100,
                    width: 100,
                    child: Center(
                      child: Circular(
                        color: Color(0xFFFCBF1E),
                      ),
                    ),
                  );
                });
            await registerUser('+91${_phoneTextController.text}', context);
          }, context, 'Login'),
        )
      ],
    );
  }
}

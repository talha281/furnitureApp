import 'package:flutter/material.dart';

class EditTextUtils {
  TextFormField getCustomEditTextArea({
    BuildContext? context,
    String labelValue = "",
    String hintValue = "",
    Function? validator,
    IconData? icon,
    bool? validation,
    TextEditingController? controller,
    TextInputType keyboardType = TextInputType.text,
    String? validationErrorMsg,
  }) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.black,
      //ConstColor.primaryColor,
      cursorHeight: 25,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.black,
          //ConstColor.primaryColor,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixStyle: TextStyle(color: Colors.black),
        //ConstColor.primaryColor),
        // fillColor: Colors.white.withOpacity(0.6),
        labelStyle: TextStyle(color: Colors.black),
        // ConstColor.primaryColor),
        focusColor: Colors.black,
        // ConstColor.primaryColor,
        filled: true,
        isDense: true,
        border: buildOutlineInputBorder( Colors.black),
          //ConstColor.primaryColor),
        disabledBorder: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(8.0),
          ),
          borderSide: new BorderSide(
            color: Colors.black, 
            //ConstColor.primaryColor,
            width: 1.0,
          ),
        ),
        focusedBorder: buildOutlineInputBorder(Colors.amber),
          //ConstColor.primaryColor),
        hintText: hintValue,
        labelText: labelValue,
      ),
      validator: validator as String? Function(String?)?,
    );
  }
}

OutlineInputBorder buildOutlineInputBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: color,
      width: 1.4,
    ),
  );
}

class RegisterTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextAlign textAlign;
  final TextInputType? keyboardType;
  final Function? onEditingComplete, onTap;

  RegisterTextField(
      this.controller, this.hintText, this.textAlign, this.keyboardType,
      {this.onEditingComplete, this.onTap});
  @override
  Widget build(BuildContext context) {
    return TextField(
        textAlign: textAlign,
        keyboardType: keyboardType,
        onEditingComplete: onEditingComplete as void Function()?,
        onTap: onTap as void Function()?,
        showCursor: true,
        style: TextStyle(fontWeight: FontWeight.w500),
        cursorHeight: 15,
        cursorColor: Colors.black,
        //ConstColor.primaryColor,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          fillColor: Colors.transparent,
          isDense: true,
          filled: true,
          hintStyle: TextStyle(
            color: Color(0xFF666666),
          ),
        ));
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

// list of colors that we use in our app
const kBackgroundColor = Color(0xFFF1EFF1);
const kPrimaryColor = Color(0xFF301b1b);
const kSecondaryColor = Colors.amber;
const kTextColor = Color(0xFF000839);
const kTextLightColor = Color(0xFF747474);
const kBlueColor = Color(0xFF40BAD5);

const kDefaultPadding = 20.0;
const availableColors = [
  Color(0xFFFCEF2F),
  Color(0xFF40BAD5),
  Color(0xFFFCBF1E),
  Color(0xFF301b1b),
];
Color _bgColors = availableColors[Random().nextInt(3)];

// our default Shadow
const kDefaultShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black12, // Black color with 12% opacity
);

String emptyCartText = 'No items in your Cart';

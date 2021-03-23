import 'package:flutter/material.dart';

class ConstPadding {
  /// Please name constant variables in the format: for [All]:
  static const EdgeInsets all8 = EdgeInsets.all(8);
  static const EdgeInsets all12 = EdgeInsets.all(12);
  static const EdgeInsets all15 = EdgeInsets.all(15);
  static const EdgeInsets all25 = EdgeInsets.all(25);
  static const EdgeInsets all10 = EdgeInsets.all(10);
  static const EdgeInsets all20 = EdgeInsets.all(20);

  /// Please name constant variables in the format: for [LTRB]:
  static const EdgeInsets l1t1r1b1 = EdgeInsets.fromLTRB(1, 1, 1, 1);
  static const EdgeInsets l25r25b10 = EdgeInsets.fromLTRB(25, 0, 25, 10);
  static const EdgeInsets l18t8b8 = EdgeInsets.fromLTRB(18, 8, 0, 8);
  static const EdgeInsets l30t25r30b25 = EdgeInsets.fromLTRB(30, 25, 30, 25);
  static const EdgeInsets l18t15r10 = EdgeInsets.fromLTRB(18, 15, 10, 0);
  static const EdgeInsets l110t20r110 = EdgeInsets.fromLTRB(110, 20, 110, 0);
  static const EdgeInsets l15t50r15 = EdgeInsets.fromLTRB(15, 50, 15, 0);
  static const EdgeInsets l12t25 = EdgeInsets.fromLTRB(12, 25, 0, 0);
  static const EdgeInsets t8r8b5 = EdgeInsets.fromLTRB(0, 8, 8, 5);
  static const EdgeInsets t15r8b15 = EdgeInsets.fromLTRB(0, 15, 8, 15);
  static const EdgeInsets t28b15 = EdgeInsets.fromLTRB(0, 28, 0, 15);
  static const EdgeInsets t28b20 = EdgeInsets.fromLTRB(0, 28, 0, 20);
  static const EdgeInsets l16t48r17b16 = EdgeInsets.fromLTRB(10, 48, 8.0, 16.0);

  /// Please name constant variables in the format: for [Only]:
  static const EdgeInsets onlyR10 = EdgeInsets.only(right: 10);
  static const EdgeInsets onlyT10 = EdgeInsets.only(top: 10);
  static const EdgeInsets onlyB10 = EdgeInsets.only(bottom: 10);
  static const EdgeInsets onlyB8 = EdgeInsets.only(bottom: 8);
  static const EdgeInsets onlyl8 = EdgeInsets.only(left: 8);
  static const EdgeInsets onlyl18 = EdgeInsets.only(left: 18);
  static const EdgeInsets onlyl12 = EdgeInsets.only(left: 12);
  static const EdgeInsets onlyl22 = EdgeInsets.only(left: 22);

  /// Please name constant variables in the format: for [Symmetric]:
  static const EdgeInsets symmH1V1 =
      EdgeInsets.symmetric(horizontal: 1, vertical: 1);
  static const EdgeInsets symmH20 = EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets symmH10 = EdgeInsets.symmetric(horizontal: 10);
  static const EdgeInsets symmH22 = EdgeInsets.symmetric(horizontal: 22);
  static const EdgeInsets symmV10 = EdgeInsets.symmetric(vertical: 10);
  static const EdgeInsets symmH20V8 =
      EdgeInsets.symmetric(horizontal: 20, vertical: 8);
  static const EdgeInsets symmH22V8 =
      EdgeInsets.symmetric(horizontal: 22, vertical: 8);
  static const EdgeInsets symmH20V5 =
      EdgeInsets.symmetric(horizontal: 20, vertical: 5);

  static const EdgeInsets symmH15V7 =
      EdgeInsets.symmetric(horizontal: 15, vertical: 7);
}

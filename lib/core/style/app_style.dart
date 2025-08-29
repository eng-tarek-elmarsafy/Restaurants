import 'package:flutter/material.dart';
import '../../constrains.dart';

abstract class AppStyle {
  static const TextStyle titleStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: kNeutralColor,
    fontFamily: 'Cairo',
  );

  static const TextStyle subtitleStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: kNeutralColor,
    fontFamily: 'Cairo',
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: kNeutralColor,
    fontFamily: 'Cairo',
  );

  static const TextStyle smallTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: kNeutralColor,
    fontFamily: 'Cairo',
  );
}

int x = 5;

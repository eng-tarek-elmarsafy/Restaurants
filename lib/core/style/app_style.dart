import 'package:flutter/material.dart';
import 'package:restaurants/constrains.dart';

abstract class AppStyle {
  static final TextStyle titleStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: kNeutralColor,
    fontFamily: 'Cairo',
  );

  static final TextStyle subtitleStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: kNeutralColor,
    fontFamily: 'Cairo',
  );

  static final TextStyle buttonTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: kNeutralColor,
    fontFamily: 'Cairo',
  );

  static final TextStyle smallTextStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.normal,
    color: kNeutralColor,
    fontFamily: 'Cairo',
  );
}

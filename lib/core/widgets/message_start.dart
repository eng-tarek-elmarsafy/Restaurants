import 'package:flutter/material.dart';
import 'package:restaurants/core/style/app_style.dart';

class MessageStart extends StatelessWidget {
  const MessageStart({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: AppStyle.buttonTextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}

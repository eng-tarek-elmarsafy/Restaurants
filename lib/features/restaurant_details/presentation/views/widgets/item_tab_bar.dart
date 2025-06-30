import 'package:flutter/material.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/function/height.dart';
import 'package:restaurants/core/style/app_style.dart';

class ItemTabBar extends StatelessWidget {
  const ItemTabBar({super.key, required this.isActev, required this.title});
  final bool isActev;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: AppStyle.buttonTextStyle),
        height(10),
        Container(
          width: 60,
          height: 3.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: isActev ? kSecondaryColor : Colors.transparent,
          ),
        ),
      ],
    );
  }
}

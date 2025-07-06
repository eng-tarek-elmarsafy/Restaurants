import 'package:flutter/material.dart';

class CartActionAddOrDele extends StatelessWidget {
  const CartActionAddOrDele({
    super.key,
    required this.backGroundColor,
    required this.icon,
    required this.iconColor,
  });
  final Color backGroundColor;
  final IconData icon;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: backGroundColor, shape: BoxShape.circle),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Icon(icon, color: iconColor, size: 25),
      ),
    );
  }
}

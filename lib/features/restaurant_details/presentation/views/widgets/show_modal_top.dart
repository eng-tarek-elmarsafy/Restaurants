import 'package:flutter/material.dart';
import 'package:restaurants/constrains.dart';

class ShowModalTop extends StatelessWidget {
  const ShowModalTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 3.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kSecondaryColor,
      ),
    );
  }
}

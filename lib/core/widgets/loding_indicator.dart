import 'package:flutter/material.dart';
import 'package:restaurants/constrains.dart';

class LodingIndicator extends StatelessWidget {
  const LodingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(color: kSecondaryColor);
  }
}

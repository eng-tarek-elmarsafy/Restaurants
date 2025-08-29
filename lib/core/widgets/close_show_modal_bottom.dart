import 'package:flutter/material.dart';
import '../../constrains.dart';

class CloseShowModalBottom extends StatelessWidget {
  const CloseShowModalBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        height: 5,
        width: 100,
        decoration: const BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    );
  }
}

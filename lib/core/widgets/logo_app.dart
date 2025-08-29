import 'package:flutter/material.dart';
import '../style/assets.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({super.key, this.isSplash = false});
  final bool isSplash;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isSplash ? null : 150,
      child: Image.asset(Assets.imagesImagesLogo),
    );
  }
}

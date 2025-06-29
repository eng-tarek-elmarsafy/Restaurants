import 'package:flutter/material.dart';
import 'package:restaurants/core/style/app_style.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('مطاعم', style: AppStyle.titleStyle),
    );
  }
}

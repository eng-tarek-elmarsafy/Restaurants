import 'package:flutter/material.dart';
import 'package:restaurants/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  static const String id = 'splash_view';
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashViewBody());
  }
}

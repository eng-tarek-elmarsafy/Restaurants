import 'package:flutter/material.dart';
import 'package:restaurants/core/helper/on_generate_route_function.dart';
import 'package:restaurants/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const Restaurants());
}

class Restaurants extends StatelessWidget {
  const Restaurants({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.id,
      onGenerateRoute: onGenerateRoute,
    );
  }
}

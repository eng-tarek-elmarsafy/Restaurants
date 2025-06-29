import 'package:flutter/material.dart';
import 'package:restaurants/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case SplashView.id:
      return MaterialPageRoute(builder: (context) => const SplashView());

   
    default:
      return MaterialPageRoute(
        builder:
            (context) =>
                const Scaffold(body: Center(child: Text('Route not found'))),
      );
  }
}

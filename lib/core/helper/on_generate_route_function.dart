import 'package:flutter/material.dart';
import 'package:restaurants/features/auth/presentation/views/login_view.dart';
import 'package:restaurants/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case SplashView.id:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case LoginView.id:
      return MaterialPageRoute(builder: (context) => const LoginView());

    default:
      return MaterialPageRoute(
        builder:
            (context) =>
                const Scaffold(body: Center(child: Text('Route not found'))),
      );
  }
}

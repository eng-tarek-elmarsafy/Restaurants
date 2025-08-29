import 'package:flutter/material.dart';
import '../../features/auth/presentation/views/sign_in_view.dart';
import '../../features/auth/presentation/views/sign_up_view.dart';
import '../../features/home/domain/entities/restaurant_entity.dart';
import '../../features/main/presentation/views/main_view.dart';
import '../../features/restaurant_details/presentation/views/restaurnt_details_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case SplashView.id:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case SignUpView.id:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    case MainView.id:
      return MaterialPageRoute(builder: (context) => const MainView());
    case SignInView.id:
      return MaterialPageRoute(builder: (context) => const SignInView());
    case RestaurntDetailsView.id:
      return MaterialPageRoute(
        builder:
            (context) => RestaurntDetailsView(
              restaurant: setting.arguments as RestaurantEntity,
            ),
      );

    default:
      return MaterialPageRoute(
        builder:
            (context) =>
                const Scaffold(body: Center(child: Text('Route not found'))),
      );
  }
}

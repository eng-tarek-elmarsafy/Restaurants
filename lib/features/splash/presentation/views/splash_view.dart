import 'package:flutter/material.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/services/shared_preferences.dart';
import 'package:restaurants/features/auth/presentation/views/sign_in_view.dart';
import 'package:restaurants/features/main/presentation/views/main_view.dart';
import 'package:restaurants/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const String id = 'splash_view';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      if (Prefs.getBool(kIsSignIn)) {
        Navigator.pushReplacementNamed(context, MainView.id);
      } else {
        Navigator.pushReplacementNamed(context, SignInView.id);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplashViewBody());
  }
}

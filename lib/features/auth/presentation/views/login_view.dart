import 'package:flutter/material.dart';
import 'package:restaurants/features/auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String id = 'login_view';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: LoginViewBody());
  }
}

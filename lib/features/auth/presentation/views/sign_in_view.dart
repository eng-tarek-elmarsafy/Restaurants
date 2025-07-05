import 'package:flutter/material.dart';
import 'package:restaurants/features/auth/presentation/views/widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const String id = 'login_view';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SignInViewBody());
  }
}

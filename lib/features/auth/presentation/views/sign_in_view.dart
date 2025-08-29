import 'package:flutter/material.dart';
import 'widgets/sign_in_view_bloc_consumer.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const String id = 'login_view';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SignInViewBlocConsumer());
  }
}

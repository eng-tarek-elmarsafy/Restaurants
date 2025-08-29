import 'package:flutter/material.dart';
import 'widgets/sign_up_bloc_consumer.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String id = 'sin_up_view';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SignUpBlocConsumer());
  }
}

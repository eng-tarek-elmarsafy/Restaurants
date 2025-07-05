import 'package:flutter/material.dart';
import 'package:restaurants/features/auth/presentation/views/widgets/sign_up_bloc_cons.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String id = 'sin_up_view';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SignUpBlocConsumer());
  }
}

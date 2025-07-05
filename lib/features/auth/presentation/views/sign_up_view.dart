import 'package:flutter/widgets.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String id = 'sin_up_view';
  @override
  Widget build(BuildContext context) {
    return const SignUpViewBody();
  }
}

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(child: Column(children: []));
  }
}

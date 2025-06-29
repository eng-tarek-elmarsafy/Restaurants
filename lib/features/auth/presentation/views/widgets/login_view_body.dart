import 'package:flutter/material.dart';
import 'package:restaurants/core/function/height.dart';
import 'package:restaurants/core/widgets/custom_button.dart';
import 'package:restaurants/core/widgets/custom_text_form_field.dart';
import 'package:restaurants/core/widgets/logo_app.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            height(170),
            SizedBox(height: 50, child: LogoApp()),
            height(100),
            CustomTextFormField(hintText: 'الاسم'),
            height(16),
            CustomTextFormField(hintText: 'رقم التلفون  '),
            height(16),
            CustomButton(title: 'تسجيل الدخول', onPressed: () {}),
            height(16),
          ],
        ),
      ),
    );
  }
}

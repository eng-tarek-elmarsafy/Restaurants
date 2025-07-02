import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:restaurants/core/function/height.dart';
import 'package:restaurants/core/function/validator_hone_umber.dart';
import 'package:restaurants/core/function/validator_name.dart';
import 'package:restaurants/core/widgets/custom_button.dart';
import 'package:restaurants/core/widgets/custom_text_form_field.dart';
import 'package:restaurants/core/widgets/logo_app.dart';
import 'package:restaurants/features/home/presentation/views/home_view.dart';
import 'package:restaurants/features/main/presentation/views/main_view.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late AutovalidateMode autovalidateMode;
  late GlobalKey<FormState> formKey;
  late String name;
  late String phoneNumber;

  @override
  void initState() {
    formKey = GlobalKey();
    autovalidateMode = AutovalidateMode.disabled;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              height(150),
              const SizedBox(height: 50, child: LogoApp()),
              height(100),
              CustomTextFormField(
                hintText: 'الاسم',
                onSaved: (value) {
                  name = value!;
                },
                validator: (value) {
                  return validatorName(value);
                },
              ),
              height(16),
              CustomTextFormField(
                hintText: 'رقم التلفون  ',
                textInputType: const TextInputType.numberWithOptions(),
                validator: (value) {
                  return validatorPhoneNumber(value);
                },
                onSaved: (value) {
                  phoneNumber = value!;
                },
              ),
              height(16),
              CustomButton(
                title: 'تسجيل الدخول',
                onPressed: () {
                  Navigator.pushNamed(context, MainView.id);
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    log(name);
                    log(phoneNumber);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              ),
              height(16),
            ],
          ),
        ),
      ),
    );
  }
}

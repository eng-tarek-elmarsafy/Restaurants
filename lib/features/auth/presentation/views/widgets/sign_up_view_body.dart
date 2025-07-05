import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/core/function/validator.dart';
import 'package:restaurants/core/style/app_style.dart';
import 'package:restaurants/core/widgets/custom_button.dart';
import 'package:restaurants/core/widgets/custom_text_form_field.dart';
import 'package:restaurants/core/widgets/eye_icon_obscure.dart';
import 'package:restaurants/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:restaurants/features/auth/presentation/views/widgets/rich_text_with_action.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  late GlobalKey<FormState> formKey;
  late AutovalidateMode autovalidateMode;
  late String name;
  late String phone;
  late String email;
  late String password;
  bool obscureText = true;
  @override
  void initState() {
    formKey = GlobalKey();
    autovalidateMode = AutovalidateMode.disabled;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 90),
              const Align(
                child: Text('إنشاء حساب جديد', style: AppStyle.titleStyle),
              ),
              const SizedBox(height: 100),
              CustomTextFormField(
                hintText: 'الاسم',
                onSaved: (value) {
                  name = value!;
                },
                validator: validatorName,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'رقم الهاتف',
                textInputType: const TextInputType.numberWithOptions(),
                onSaved: (value) {
                  phone = value!;
                },
                validator: validatorPhoneNumber,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'البريد الإلكتروني',
                onSaved: (value) {
                  email = value!;
                },
                validator: validateEmail,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                obscureText: obscureText,
                hintText: 'كلمة المرور',
                onSaved: (value) {
                  password = value!;
                },
                validator: validatePassword,
                suffixIcon: EyeIconObscure(
                  onChange: (value) {
                    setState(() {
                      obscureText = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 16),
              const RichTextWithAction(
                normalText: 'من خلال إنشاء حساب ، فإنك توافق على ',
                actionText: 'الشروط والأحكام الخاصة بنا',
              ),
              const SizedBox(height: 16),
              CustomButton(
                title: 'إنشاء حساب جديد',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SignUpCubit>().signUpWithEmail(
                      name,
                      email,
                      phone,
                      password,
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              ),
              const SizedBox(height: 16),

              const Align(
                child: RichTextWithAction(
                  normalText: 'تمتلك حساب بالفعل؟',
                  actionText: ' تسجيل دخول',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

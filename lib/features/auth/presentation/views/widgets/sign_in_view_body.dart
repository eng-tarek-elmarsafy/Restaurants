import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/style/app_style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/eye_icon_obscure.dart';
import '../../manager/sign_in_cubit/sign_in_cubit.dart';
import '../sign_up_view.dart';
import 'rich_text_with_action.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignInViewBody> {
  late GlobalKey<FormState> formKey;
  late AutovalidateMode autovalidateMode;
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
                child: Text('تسجيل دخول', style: AppStyle.titleStyle),
              ),
              const SizedBox(height: 100),
              CustomTextFormField(
                hintText: 'البريد الإلكتروني',
                onSaved: (value) {
                  email = value!;
                },
                // validator: validateEmail,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                obscureText: obscureText,
                hintText: 'كلمة المرور',
                onSaved: (value) {
                  password = value!;
                },
                // validator: validatePassword,
                suffixIcon: EyeIconObscure(
                  onChange: (value) {
                    setState(() {
                      obscureText = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 16),

              CustomButton(
                title: 'تسجيل دخول',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SignInCubit>().signInWithEmail(
                      email,
                      password,
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              ),
              const SizedBox(height: 16),

              Align(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SignUpView.id);
                  },
                  child: const RichTextWithAction(
                    normalText: 'لا تمتلك حساب ؟',
                    actionText: 'قم بإنشاء حساب',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

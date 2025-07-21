import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:restaurants/core/style/app_style.dart';
import 'package:restaurants/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:restaurants/features/auth/presentation/views/widgets/sign_in_view_body.dart';
import 'package:restaurants/features/main/presentation/views/main_view.dart';

class SignInViewBlocConsumer extends StatefulWidget {
  const SignInViewBlocConsumer({super.key});

  @override
  State<SignInViewBlocConsumer> createState() => _SignInViewBlocConsumerState();
}

class _SignInViewBlocConsumerState extends State<SignInViewBlocConsumer> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage, style: AppStyle.titleStyle),
            ),
          );
        }
        if (state is SignInSuccess) {
          Navigator.pushNamed(context, MainView.id);
        }
      },
      builder: (context, state) {
        if (state is SignInSuccess) {
          return const SignInViewBody();
        }
        return ModalProgressHUD(
          inAsyncCall: state is SignInLoading,
          child: const SignInViewBody(),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:restaurants/core/widgets/loding_indicator.dart';
import 'package:restaurants/features/auth/presentation/views/sign_in_view.dart';
import 'package:restaurants/core/style/app_style.dart';
import 'package:restaurants/features/acconut/presentation/manager/sign_out_cubit/sign_out_cubit.dart';
import 'package:restaurants/features/acconut/presentation/views/widgets/account_body.dart';

class SignOutBlocConsumer extends StatelessWidget {
  const SignOutBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignOutCubit, SignOutState>(
      listener: (context, state) {
        if (state is SignOutSuccess) {
          Navigator.pushReplacementNamed(context, SignInView.id);
        }
        if (state is SignOutFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message, style: AppStyle.titleStyle)),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignOutLoading,
          progressIndicator: const LodingIndicator(),
          child: const AccountBody(),
        );
      },
    );
  }
}

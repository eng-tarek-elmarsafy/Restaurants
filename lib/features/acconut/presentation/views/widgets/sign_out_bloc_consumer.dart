import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../../core/style/app_style.dart';
import '../../manager/sign_out_cubit/sign_out_cubit.dart';
import 'account_body.dart';

class SignOutBlocConsumer extends StatelessWidget {
  const SignOutBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignOutCubit, SignOutState>(
      listener: (context, state) {
        if (state is SignOutSuccess) {
          Navigator.pop(context);
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
          child: const AccountBody(),
        );
      },
    );
  }
}

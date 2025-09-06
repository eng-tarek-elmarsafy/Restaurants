import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:restaurants/core/widgets/loding_indicator.dart';
import '../../../../../core/style/app_style.dart';
import '../../manager/sign_up_cubit/sign_up_cubit.dart';
import 'sign_up_view_body.dart';
import '../../../../main/presentation/views/main_view.dart';

class SignUpBlocConsumer extends StatelessWidget {
  const SignUpBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage, style: AppStyle.titleStyle),
            ),
          );
        }

        if (state is SignUpSuccess) {
          Navigator.pushNamed(context, MainView.id);
        }
      },
      builder: (context, state) {
        if (state is SignUpSuccess) {
          return const SignUpViewBody();
        }
        return ModalProgressHUD(
          inAsyncCall: state is SignUpLoading,
          progressIndicator: const LodingIndicator(),
          child: const SignUpViewBody(),
        );
      },
    );
  }
}

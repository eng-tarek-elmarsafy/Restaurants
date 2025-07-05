import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/core/style/app_style.dart';
import 'package:restaurants/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:restaurants/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:restaurants/features/main/presentation/views/main_view.dart';

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
        if (state is SignUpLoading) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Lodaing', style: AppStyle.titleStyle),
            ),
          );
        }
        if (state is SignUpSuccess) {
          Navigator.pushNamed(context, MainView.id);
        }
      },
      builder: (context, state) {
        return const SignUpViewBody();
      },
    );
  }
}

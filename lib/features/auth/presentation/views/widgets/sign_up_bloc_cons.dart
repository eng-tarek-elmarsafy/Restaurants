import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:restaurants/features/auth/presentation/views/widgets/sign_up_view_body.dart';

class SignUpBlocCons extends StatelessWidget {
  const SignUpBlocCons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {},
      builder: (context, state) {
        return const SignUpViewBody();
      },
    );
  }
}

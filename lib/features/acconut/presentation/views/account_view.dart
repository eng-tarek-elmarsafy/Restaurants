import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helper/get_it_setup.dart';
import '../manager/sign_out_cubit/sign_out_cubit.dart';
import 'widgets/sign_out_bloc_consumer.dart';
import '../../../auth/domain/repo/auth_repo.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignOutCubit(getIt.get<AuthRepo>()),
      child: const SignOutBlocConsumer(),
    );
  }
}

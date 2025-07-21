import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/services/shared_preferences.dart';
import 'package:restaurants/core/style/app_style.dart';
import 'package:restaurants/features/acconut/presentation/manager/sign_out_cubit/sign_out_cubit.dart';
import 'package:restaurants/features/acconut/presentation/manager/update_user_data_cubit/update_user_data_cubit.dart';
import 'package:restaurants/features/acconut/presentation/views/widgets/profile_image.dart';
import 'package:restaurants/features/acconut/presentation/views/widgets/user_info_edit_tile.dart';

class AccountBody extends StatefulWidget {
  const AccountBody({super.key});

  @override
  State<AccountBody> createState() => _AccountBodyState();
}

class _AccountBodyState extends State<AccountBody> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      context.watch<UpdateUserDataCubit>().state is UpdateUserDataSuccess;
    });
    return Column(
      children: [
        const SizedBox(height: 50, width: double.infinity),
        const ProfileImage(),
        const SizedBox(height: 10),

        UserInfoEditTile(
          action: kUserName,
          title: 'تعديل الاسم',
          text: Text(Prefs.getString(kUserName), style: AppStyle.titleStyle),
        ),
        UserInfoEditTile(
          action: kUserphone,
          title: 'تعديل رقم الجوال',
          text: Text(Prefs.getString(kUserphone), style: AppStyle.titleStyle),
        ),

        Text(Prefs.getString(kEmail), style: AppStyle.subtitleStyle),

        const Spacer(),
        TextButton(
          onPressed: () {
            context.read<SignOutCubit>().signOut();
          },
          child: const Text('تسجيل الخروج', style: AppStyle.buttonTextStyle),
        ),
      ],
    );
  }
}

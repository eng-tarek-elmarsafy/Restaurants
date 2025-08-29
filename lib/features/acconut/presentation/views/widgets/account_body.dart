import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constrains.dart';
import '../../../../../core/services/shared_preferences.dart';
import '../../../../../core/style/app_style.dart';
import '../../manager/sign_out_cubit/sign_out_cubit.dart';
import '../../manager/update_user_data_cubit/update_user_data_cubit.dart';
import 'profile_image.dart';
import 'user_info_edit_tile.dart';

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
        const SizedBox(height: 10),
        UserInfoEditTile(
          action: kAddress,
          title: 'تعديل العنوان',
          text: SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(
              Prefs.getString(kAddress) ?? 'العنوان غير محدد',
              style: AppStyle.subtitleStyle,
            ),
          ),
        ),

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

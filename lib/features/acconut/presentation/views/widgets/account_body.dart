import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/services/shared_preferences.dart';
import 'package:restaurants/core/style/app_style.dart';
import 'package:restaurants/core/widgets/user_avatar.dart';
import 'package:restaurants/features/acconut/presentation/manager/update_user_data_cubit/update_user_data_cubit.dart';
import 'package:restaurants/features/acconut/presentation/views/widgets/user_info_edit_tile.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({super.key});

  @override
  Widget build(BuildContext context) {
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
      ],
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const UserAvatar(radius: 50),
        Positioned(
          right: -10,
          bottom: -10,
          child: IconButton(
            onPressed: () async {
              ImagePicker picker = ImagePicker();
              final XFile? image = await picker.pickImage(
                source: ImageSource.gallery,
              );
              if (image != null) {
                File imageFile = File(image.path);
                context.read<UpdateUserDataCubit>().updateUserAvatar(imageFile);
              }
            },
            icon: Container(
              color: kPrimaryColor,
              child: const Icon(Icons.camera_alt, color: kSecondaryColor),
            ),
          ),
        ),
      ],
    );
  }
}

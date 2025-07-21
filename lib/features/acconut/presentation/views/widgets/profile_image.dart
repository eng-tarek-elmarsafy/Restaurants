import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/widgets/user_avatar.dart';
import 'package:restaurants/features/acconut/presentation/manager/update_user_data_cubit/update_user_data_cubit.dart';

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
                // ignore: use_build_context_synchronously
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
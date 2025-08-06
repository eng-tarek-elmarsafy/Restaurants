import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/services/shared_preferences.dart';
import 'package:restaurants/core/style/app_style.dart';
import 'package:restaurants/core/widgets/user_avatar.dart';
import 'package:restaurants/features/acconut/presentation/manager/update_user_data_cubit/update_user_data_cubit.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({super.key});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateUserDataCubit, UpdateUserDataState>(
      listener: (context, state) {
        if (state is UpdateUserDataSuccess) {
          setState(() {});
        } else if (state is UpdateUserDataFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.err, style: AppStyle.titleStyle)),
          );
        }
      },
      child: UserAvatar(radius: 50, imageUrl: Prefs.getString(kImageProfile)),
      // child: Stack(
      //   children: [
      //     UserAvatar(radius: 50, imageUrl: Prefs.getString(kImageProfile)),
      //     Positioned(
      //       right: -10,
      //       bottom: -10,
      //       child: IconButton(
      //         onPressed: () async {
      //           ImagePicker picker = ImagePicker();
      //           final XFile? image = await picker.pickImage(
      //             source: ImageSource.gallery,
      //           );
      //           if (image != null) {
      //             File imageFile = File(image.path);
      //             // ignore: use_build_context_synchronously
      //             context.read<UpdateUserDataCubit>().updateUserAvatar(
      //               imageFile,
      //             );
      //           }
      //         },
      //         icon: Container(
      //           color: kPrimaryColor,
      //           child: const Icon(Icons.camera_alt, color: kSecondaryColor),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

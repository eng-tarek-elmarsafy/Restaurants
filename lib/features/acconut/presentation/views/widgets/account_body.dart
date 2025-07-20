import 'package:flutter/material.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/function/custom_editShow_modal_bottom_sheet.dart';
import 'package:restaurants/core/services/shared_preferences.dart';
import 'package:restaurants/core/style/app_style.dart';
import 'package:restaurants/core/widgets/user_avatar.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50, width: double.infinity),
        const UserAvatar(radius: 50),
        const SizedBox(height: 20),
        Text(Prefs.getString(kUserName), style: AppStyle.titleStyle),
        Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                customEditShowModalBottomSheet(
                  context,
                  title: 'تعديل رقم الجوال',
                  action: kUserphone,
                );
              },
              icon: const Icon(Icons.edit_outlined, color: kSecondaryColor),
            ),
            Text(Prefs.getString(kUserphone), style: AppStyle.subtitleStyle),

            const SizedBox(width: 25),
          ],
        ),

        Text(Prefs.getString(kEmail), style: AppStyle.subtitleStyle),
      ],
    );
  }
}

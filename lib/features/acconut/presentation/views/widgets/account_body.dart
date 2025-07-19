import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/services/shared_preferences.dart';
import 'package:restaurants/core/style/app_style.dart';
import 'package:restaurants/core/widgets/user_avatar.dart';
import 'package:restaurants/features/acconut/presentation/views/widgets/show_modal_bottom_sheet_edit_body.dart';

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
            Text(Prefs.getString(kUserphone), style: AppStyle.subtitleStyle),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => const ShowModalBottomSheetEditBody(),
                );
              },
              icon: const Icon(Icons.edit_outlined, color: kSecondaryColor),
            ),
          ],
        ),

        Text(Prefs.getString(kEmail), style: AppStyle.subtitleStyle),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:restaurants/constrains.dart';
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
        Stack(
          clipBehavior: Clip.none,
          children: [
            Text(Prefs.getString(kUserphone), style: AppStyle.subtitleStyle),
            Positioned(
              right: -40,
              top: -15,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit_outlined, color: kNeutralColor),
              ),
            ),
          ],
        ),
        Text(Prefs.getString(kEmail), style: AppStyle.subtitleStyle),
      ],
    );
  }
}

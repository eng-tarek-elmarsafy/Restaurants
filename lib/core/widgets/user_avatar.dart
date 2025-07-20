import 'package:flutter/material.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/services/shared_preferences.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key, this.radius = 30});
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor:
          Prefs.getString(kImageProfile) != null ? null : kSecondaryColor,

      backgroundImage:
          Prefs.getString(kImageProfile) != null
              ? NetworkImage(Prefs.getString(kImageProfile))
              : null,
      child:
          Prefs.getString(kImageProfile) != null
              ? const SizedBox.shrink()
              : Center(
                child: Icon(
                  Icons.account_circle_rounded,
                  size: radius == null ? 60 : radius! * 2,
                  color: kPrimaryColor,
                ),
              ),
    );
  }
}

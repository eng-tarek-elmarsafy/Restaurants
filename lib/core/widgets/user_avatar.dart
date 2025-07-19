import 'package:flutter/material.dart';
import 'package:restaurants/constrains.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key, this.radius = 30});
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: kSecondaryColor,
      child: Center(
        child: Icon(
          Icons.account_circle_rounded,
          size: radius == null ? 60 : radius! * 2,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}

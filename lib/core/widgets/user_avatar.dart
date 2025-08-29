import 'package:flutter/material.dart';
import '../../constrains.dart';

class UserAvatar extends StatefulWidget {
  const UserAvatar({super.key, this.radius = 30, this.imageUrl});
  final double? radius;
  final String? imageUrl;
  @override
  State<UserAvatar> createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: widget.radius,
      backgroundColor: kSecondaryColor,

      child: Center(
        child: Icon(
          Icons.account_circle_rounded,
          size: widget.radius == null ? 60 : widget.radius! * 2,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}

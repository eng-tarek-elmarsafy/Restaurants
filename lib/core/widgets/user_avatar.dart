import 'package:flutter/material.dart';
import 'package:restaurants/constrains.dart';

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
      backgroundColor: widget.imageUrl != null ? null : kSecondaryColor,

      backgroundImage:
          widget.imageUrl != null ? NetworkImage(widget.imageUrl!) : null,
      child:
          widget.imageUrl != null
              ? const SizedBox.shrink()
              : Center(
                child: Icon(
                  Icons.account_circle_rounded,
                  size: widget.radius == null ? 60 : widget.radius! * 2,
                  color: kPrimaryColor,
                ),
              ),
    );
  }
}

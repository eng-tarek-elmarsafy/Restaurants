import 'package:flutter/material.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/function/custom_editShow_modal_bottom_sheet.dart';

class UserInfoEditTile extends StatelessWidget {
  const UserInfoEditTile({
    super.key,
    required this.action,
    required this.title,
    required this.text,
  });

  final String action;
  final String title;
  final Widget text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            customEditShowModalBottomSheet(
              context,
              title: title,
              action: action,
            );
          },
          child: const Icon(Icons.edit_outlined, color: kSecondaryColor),
        ),

        // Text(, style: AppStyle.subtitleStyle),
        text,

        const SizedBox(width: 25),
      ],
    );
  }
}

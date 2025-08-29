import 'package:flutter/material.dart';
import '../../constrains.dart';
import '../style/app_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.onPressed});
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: 54,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: kSecondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius / 2),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: AppStyle.buttonTextStyle.copyWith(color: kPrimaryColor),
        ),
      ),
    );
  }
}

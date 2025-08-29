import 'package:flutter/material.dart';
import '../../../../../constrains.dart';
import '../../../../../core/style/app_style.dart';

class OrderActions extends StatelessWidget {
  const OrderActions({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kSecondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'الغاء',
              style: AppStyle.buttonTextStyle.copyWith(color: kPrimaryColor),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: onTap,
            child: Text(
              'تأكيد الطلب',
              style: AppStyle.buttonTextStyle.copyWith(color: kSecondaryColor),
            ),
          ),
        ),
      ],
    );
  }
}

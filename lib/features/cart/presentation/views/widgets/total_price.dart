import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constrains.dart';
import '../../../../../core/style/app_style.dart';
import '../../manager/cart_cubit/cart_cubit.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: kSecondaryColor,
      radius: 30,
      child: Column(
        children: [
          const SizedBox(height: 10),
          Text(
            context
                .watch<CartCubit>()
                .cartEntity
                .calculateTotalPrice()
                .toString(),
            style: AppStyle.buttonTextStyle.copyWith(color: kPrimaryColor),
          ),
          Text(
            'الاجمالي',
            style: AppStyle.smallTextStyle.copyWith(color: kPrimaryColor),
          ),
        ],
      ),
    );
}
}

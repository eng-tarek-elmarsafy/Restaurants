import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/style/app_style.dart';
import 'package:restaurants/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';

class SureOrderButton extends StatelessWidget {
  const SureOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: kSecondaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () {
        if (context.read<CartCubit>().cartEntity.cartItems.isNotEmpty) {
          // Navigator.pushNamed(
          // context,
          // CheckoutView.routeName,
          // arguments: context.read<CartCubit>().cartEntity,
          // );
        } else {
          // showBar(context, 'لا يوجد منتجات في السلة');
        }
      },
      child: Text(
        'تأكيد الطلب',
        style: AppStyle.buttonTextStyle.copyWith(color: kPrimaryColor),
      ),
    );
  }
}

//${context.watch<CartCubit>().cartEntity.calculateTotalPrice()}

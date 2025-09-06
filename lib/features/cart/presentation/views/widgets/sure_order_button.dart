import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/style/app_style.dart';
import 'package:restaurants/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:restaurants/features/cart/presentation/views/widgets/order_bottom_sheet.dart';

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
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder:
                (context) => Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: const OrderBottomSheet(),
                ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: kSecondaryColor,
              content: Text('لا يوجد منتجات في سله التسوق'),
            ),
          );
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

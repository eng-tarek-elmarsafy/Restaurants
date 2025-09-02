import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/cubit/cart_icon_cubit.dart';
import 'package:restaurants/core/style/app_style.dart';
import 'package:restaurants/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:restaurants/features/main/presentation/views/main_view.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCount = context.watch<CartCubit>().cartEntity.cartItems.length;

    return Stack(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, MainView.id);
            context.read<CartIconCubit>().refresh();
          },
          icon: const Icon(Icons.shopping_cart, color: kSecondaryColor),
        ),
        Positioned(
          top: 2,
          right: 4,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: Text(
              cartCount.toString(),
              key: ValueKey<int>(cartCount),
              style: AppStyle.buttonTextStyle.copyWith(
                color: kNeutralColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

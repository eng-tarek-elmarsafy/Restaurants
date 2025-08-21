import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/features/cart/domain/entites/car_item_entity.dart';
import 'package:restaurants/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:restaurants/features/cart/presentation/manager/cart_item_cubit/cart_item_cubit.dart';
import 'package:restaurants/features/cart/presentation/views/widgets/cart_item_proaduct.dart';
import 'package:restaurants/features/cart/presentation/views/widgets/custom_divider.dart';

class CartItemProaductLisViewBlocBuilder extends StatelessWidget {
  const CartItemProaductLisViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CartItemEntity> carItems =
        context.watch<CartCubit>().cartEntity.cartItems;
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        // if (state is CartItemUpdated) {

        // }
        return SliverList.separated(
          itemCount: carItems.length,
          itemBuilder:
              (context, index) => CartItemProaduct(cartItem: carItems[index]),
          separatorBuilder: (context, index) => const CustomDivider(),
        );
      },
    );
  }
}

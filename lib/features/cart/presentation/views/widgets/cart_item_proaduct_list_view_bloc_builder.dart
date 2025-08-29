import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entites/car_item_entity.dart';
import '../../manager/cart_cubit/cart_cubit.dart';
import '../../manager/cart_item_cubit/cart_item_cubit.dart';
import 'cart_item_proaduct.dart';
import 'custom_divider.dart';

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

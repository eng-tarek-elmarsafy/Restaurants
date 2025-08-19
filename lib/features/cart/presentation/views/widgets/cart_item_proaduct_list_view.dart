import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/features/cart/domain/entites/car_item_entity.dart';
import 'package:restaurants/features/cart/presentation/manager/cart_item_cubit/cart_item_cubit.dart';
import 'package:restaurants/features/cart/presentation/views/widgets/cart_item_proaduct.dart';
import 'package:restaurants/features/cart/presentation/views/widgets/custom_divider.dart';

class CartItemProaductLisView extends StatelessWidget {
  const CartItemProaductLisView({super.key, required this.carItems});
  final List<CartItemEntity> carItems;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartItemCubit(),
      child: CartItemProaductLisViewBlocBuilder(carItems: carItems),
    );
  }
}

class CartItemProaductLisViewBlocBuilder extends StatelessWidget {
  const CartItemProaductLisViewBlocBuilder({super.key, required this.carItems});

  final List<CartItemEntity> carItems;

  @override
  Widget build(BuildContext context) {
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

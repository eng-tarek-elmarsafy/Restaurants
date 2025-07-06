import 'package:flutter/material.dart';
import 'package:restaurants/features/cart/presentation/views/widgets/cart_item_proaduct.dart';
import 'package:restaurants/features/cart/presentation/views/widgets/custom_divider.dart';

class CartItemProaductLisView extends StatelessWidget {
  const CartItemProaductLisView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) => const CartItemProaduct(),
      separatorBuilder: (context, index) => const CustomDivider(),
    );
  }
}

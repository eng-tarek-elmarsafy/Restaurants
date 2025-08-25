import 'package:flutter/material.dart';
import 'package:restaurants/core/style/app_style.dart';
import 'package:restaurants/features/history/domain/entity/order_item_entity.dart';

class CartItemListTile extends StatelessWidget {
  const CartItemListTile({super.key, required this.cartItems});

  final OrderItemEntity cartItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('الوجبه', style: AppStyle.smallTextStyle),
          trailing: Text(cartItems.name, style: AppStyle.smallTextStyle),
        ),
        ListTile(
          title: const Text('السعر', style: AppStyle.smallTextStyle),
          trailing: Text(cartItems.price, style: AppStyle.smallTextStyle),
        ),
        ListTile(
          leading: const Text('الإجمالي', style: AppStyle.smallTextStyle),
          title: Center(
            child: Text(
              '${cartItems.quanitty} * ${cartItems.price}',
              style: AppStyle.smallTextStyle,
            ),
          ),
          trailing: Text(
            cartItems.totalPrice.toString(),
            style: AppStyle.smallTextStyle,
          ),
        ),
      ],
    );
  }
}

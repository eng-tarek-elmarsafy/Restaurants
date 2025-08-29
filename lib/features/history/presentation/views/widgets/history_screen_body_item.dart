import 'package:flutter/material.dart';
import '../../../../../constrains.dart';
import '../../../../../core/function/get_date.dart';
import '../../../../../core/style/app_style.dart';
import '../../../domain/entity/history_orders_entity.dart';
import 'cart_item_list_tile.dart';

class HistoryScreenBodyItem extends StatelessWidget {
  const HistoryScreenBodyItem({super.key, required this.orders});

  final HistoryOrdersEntity orders;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: const Icon(Icons.inventory_2, color: kSecondaryColor),
      title: Text(getDate(orders.date), style: AppStyle.smallTextStyle),
      subtitle: Row(
        children: [
          const Text('الإجمالي', style: TextStyle(color: Colors.green)),
          const Spacer(),
          Text(
            orders.totalPrice.toString(),
            style: const TextStyle(color: Colors.green),
          ),
        ],
      ),
      children:
          orders.cartItems
              .map((e) => CartItemListTile(cartItems: e))
              .toList()
              .reversed
              .toList(),

      //[
      //   ListView.builder(
      //     reverse: true,
      //     shrinkWrap: true,
      //     physics: const NeverScrollableScrollPhysics(),
      //     itemCount: orders.cartItems.length,
      //     itemBuilder: (context, index) {
      //       return CartItemListTile(cartItems: orders.cartItems[index]);
      //     },
      //   ),
      // ],

      // List.generate(
      //   orders.cartItems.length,
      //   (index) => CartItemListTile(cartItems: orders.cartItems[index]),
      // ).reversed.toList(),
    );
  }
}

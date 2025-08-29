import 'package:flutter/material.dart';
import '../../../domain/entity/history_orders_entity.dart';
import 'history_screen_body_item.dart';

class HistoryScreenBody extends StatelessWidget {
  const HistoryScreenBody({super.key, required this.orders});
  final List<HistoryOrdersEntity> orders;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder:
          (context, index) => HistoryScreenBodyItem(orders: orders[index]),
    );
  }
}

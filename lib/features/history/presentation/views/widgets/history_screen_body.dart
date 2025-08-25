import 'package:flutter/material.dart';
import 'package:restaurants/features/history/domain/entity/history_orders_entity.dart';
import 'package:restaurants/features/history/presentation/views/widgets/history_screen_body_item.dart';

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

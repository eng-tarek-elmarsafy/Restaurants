import 'package:restaurants/features/history/domain/entity/order_item_entity.dart';

class HistoryOrdersEntity {
  HistoryOrdersEntity({
    required this.id,
    required this.date,
    required this.name,
    required this.phone,
    required this.address,
    required this.notes,
    required this.cartItems,
  });
  final String id;
  final String date;
  final String name;
  final String phone;
  final String address;
  final String notes;
  final List<OrderItemEntity> cartItems;
}

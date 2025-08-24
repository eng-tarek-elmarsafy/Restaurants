import 'package:restaurants/features/history/data/models/order_item_modile.dart';
import 'package:restaurants/features/history/domain/entity/history_orders_entity.dart';
import 'package:restaurants/features/history/domain/entity/order_item_entity.dart';

class HistoryOrdersModile extends HistoryOrdersEntity {
  HistoryOrdersModile({
    required super.id,
    required super.date,
    required super.name,
    required super.phone,
    required super.address,
    required super.notes,
    required super.cartItems,
  });

  factory HistoryOrdersModile.fromJson(Map<String, dynamic> json) {
    return HistoryOrdersModile(
      id: json['id'],
      date: json['date'],
      name: json['name'],
      phone: json['phone'],
      address: json['address'],
      notes: json['notes'],
      cartItems: List<OrderItemEntity>.from(
        json['cartItems'].map((e) => OrderItemModile.fromJson(e)),
      ),
    );
  }
}

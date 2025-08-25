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
    required super.totalPrice,
  });

  factory HistoryOrdersModile.fromJson(Map<String, dynamic> json) {
    return HistoryOrdersModile(
      id: json['id'],
      date: json['created_at'],
      name: json['order']['name'],
      phone: json['order']['phone'],
      address: json['order']['address'],
      notes: json['order']['notes'],
      totalPrice: json['order']['totalPrice'],
      cartItems: List<OrderItemEntity>.from(
        json['order']['cartItems'].map((e) => OrderItemModile.fromJson(e)),
      ),
    );
  }
}

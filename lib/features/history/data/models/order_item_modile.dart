import '../../domain/entity/order_item_entity.dart';

class OrderItemModile extends OrderItemEntity {
  OrderItemModile({
    required super.id,
    required super.name,
    required super.price,
    required super.quanitty,
    required super.totalPrice,
    required super.imageUrl,
    required super.category,
    required super.description,
  });

  factory OrderItemModile.fromJson(Map<String, dynamic> data) {
    return OrderItemModile(
      id: data['id'],
      name: data['name'],
      price: data['price'],
      quanitty: data['quanitty'],
      totalPrice: data['totalPrice'],
      imageUrl: data['imageUrl'],
      category: data['category'],
      description: data['description'],
    );
  }
}

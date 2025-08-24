import 'package:restaurants/features/cart/domain/entites/car_item_entity.dart';

class OrderEntity {
  OrderEntity({
    required this.userName,
    required this.phoneNumber,
    required this.address,
    required this.notes,
    required this.totalPrice,
    required this.cartItems,
  });
  final String userName;
  final String phoneNumber;
  final String address;
  final String notes;
  final double totalPrice;
  final List<CartItemEntity> cartItems;
}

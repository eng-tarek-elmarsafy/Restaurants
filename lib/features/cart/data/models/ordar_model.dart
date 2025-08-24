import 'package:restaurants/features/cart/domain/entites/car_item_entity.dart';
import 'package:restaurants/features/cart/domain/entites/ordar_entity.dart';
import 'package:restaurants/features/restaurant_details/domain/entites/meun_entity.dart';

class OrdarModel extends OrdarEntity {
  factory OrdarModel.fromEntity(OrdarEntity entity) {
    return OrdarModel(
      userName: entity.userName,
      phoneNumber: entity.phoneNumber,
      address: entity.address,
      notes: entity.notes,
      totalPrice: entity.totalPrice,
      cartItems: entity.cartItems,
    );
  }
  factory OrdarModel.fromMap(Map<String, dynamic> map) {
    return OrdarModel(
      id: map['id'],
      userName: map['name'],
      phoneNumber: map['phone'],
      address: map['address'],
      notes: map['notes'],
      totalPrice: map['totalPrice'],
      cartItems:
          List.from(map['cartItems'])
              .map(
                (e) => CartItemEntity(
                  menu: MenuItemEntity(
                    id: e['id'],
                    name: e['name'],
                    description: e['description'],
                    price: e['price'],
                    imageUrl: e['imageUrl'],
                    category: e['category'],
                  ),
                  quanitty: e['quanitty'],
                  totalPrice: e['totalPrice'],
                ),
              )
              .toList(),
    );
  }
  OrdarModel({
    this.id,
    required super.userName,
    required super.phoneNumber,
    required super.totalPrice,
    required super.address,
    required super.notes,
    required super.cartItems,
  });
  final String? id;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': userName,
      'phone': phoneNumber,
      'address': address,
      'notes': notes,
      'cartItems':
          cartItems
              .map(
                (e) => {
                  'id': e.menu.id,
                  'name': e.menu.name,
                  'price': e.menu.price,
                  'quanitty': e.quanitty,
                  'totalPrice': e.calculateTotalPrice(),
                  'imageUrl': e.menu.imageUrl,
                  'category': e.menu.category,
                  'description': e.menu.description,
                },
              )
              .toList(),
    };
  }
}

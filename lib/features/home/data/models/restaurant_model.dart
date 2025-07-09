import 'package:restaurants/features/home/domain/entities/restaurant_entity.dart';

class RestaurantModel {
  factory RestaurantModel.formEntity(RestaurantEntity entity) {
    return RestaurantModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      imageUrl: entity.imageUrl,
      address: entity.address,
      phone: entity.phone,
      category: entity.category,
      rating: entity.rating,
      openTime: entity.openTime,
      closeTime: entity.closeTime,
      deliveryFee: entity.deliveryFee,
    );
  }
  RestaurantModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.address,
    required this.phone,
    required this.category,
    required this.rating,
    required this.openTime,
    required this.closeTime,
    required this.deliveryFee,
  });

  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String address;
  final String phone;
  final String category;
  final String rating;
  final String openTime;
  final String closeTime;
  final String deliveryFee;

  RestaurantModel toJson(Map<String, dynamic> data) {
    return RestaurantModel(
      id: data['id'],
      name: data['name'],
      description: data['description'],
      imageUrl: data['imageUrl'],
      address: data['address'],
      phone: data['phone'],
      category: data['category'],
      rating: data['rating'],
      openTime: data['openTime'],
      closeTime: data['closeTime'],
      deliveryFee: data['deliveryFee'],
    );
  }
}

import 'package:restaurants/features/home/domain/entities/restaurant_entity.dart';

class RestaurantModel {
  factory RestaurantModel.formEntity(RestaurantEntity entity) {
    return RestaurantModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      imageUrl: entity.imageUrl!,
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
    this.rating = '0',
    required this.openTime,
    required this.closeTime,
    required this.deliveryFee,
  });
  static RestaurantEntity toEntity(RestaurantModel model) {
    return RestaurantEntity(
      id: model.id,
      name: model.name,
      description: model.description,
      imageUrl: model.imageUrl,
      address: model.address,
      phone: model.phone,
      category: model.category,
      rating: model.rating,
      openTime: model.openTime,
      closeTime: model.closeTime,
      deliveryFee: model.deliveryFee,
    );
  }

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

  static RestaurantModel fromJson(Map<String, dynamic> data) {
    return RestaurantModel(
      id: data['id'],
      name: data['name'],
      description: data['description'],
      imageUrl: data['image_url'],
      address: data['address'],
      phone: data['phone'],
      category: data['category'],
      // rating: data['rating'],
      openTime: data['open_time'],
      closeTime: data['close_time'],
      deliveryFee: data['delivery_fee'],
    );
  }
}

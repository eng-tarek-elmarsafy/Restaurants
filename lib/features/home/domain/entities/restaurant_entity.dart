class RestaurantEntity {
  RestaurantEntity({
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
}

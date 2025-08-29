import '../../domain/entites/rating_entity.dart';

class RatingModel {
  factory RatingModel.fromJson(Map<String, dynamic> data) {
    return RatingModel(
      id: data['id'],
      createdAt: data['created_at'],
      restaurantId: data['restaurant_id'],
      userId: data['user_id'],
      reting: (data['rating'] as num).toDouble(),
      comment: data['comment'],
      name: data['name'],
      imageUrl: data['image_url'],
    );
  }
  factory RatingModel.fromEntity(RatingEntity entity) {
    return RatingModel(
      id: entity.id,
      createdAt: entity.createdAt,
      restaurantId: entity.restaurantId,
      userId: entity.userId,
      reting: entity.reting,
      comment: entity.comment,
      imageUrl: entity.imageUrl,
      name: entity.name,
    );
  }
  RatingModel({
    this.id,
    this.createdAt,
    required this.restaurantId,
    required this.userId,
    required this.reting,
    required this.comment,
    required this.name,
    this.imageUrl,
  });

  final String? id;
  final String? createdAt;
  final String restaurantId;
  final String userId;
  final double reting;
  final String comment;
  final String name;
  final String? imageUrl;

  Map<String, dynamic> toJson() {
    return {
      'restaurant_id': restaurantId,
      'user_id': userId,
      'rating': reting,
      'comment': comment,
      'name': name,
      'image_url': imageUrl,
    };
  }

  toEntity() {
    return RatingEntity(
      restaurantId: restaurantId,
      userId: userId,
      reting: reting,
      comment: comment,
      name: name,
      imageUrl: imageUrl,
      id: id,
      createdAt: createdAt,
    );
  }
}

import 'package:restaurants/features/restaurant_details/domain/entites/reting_entity.dart';

class RatingModel {
  factory RatingModel.fromJson(Map<String, dynamic> data) {
    return RatingModel(
      id: data['id'],
      createdIt: data['created_at'],
      restaurantId: data['restaurant_id'],
      userId: data['user_id'],
      reting: (data['rating'] as num).toDouble(),
      comment: data['comment'],
    );
  }
  factory RatingModel.fromEntity(RatingEntity entity) {
    return RatingModel(
      id: entity.id,
      createdIt: entity.createdIt,
      restaurantId: entity.restaurantId,
      userId: entity.userId,
      reting: entity.reting,
      comment: entity.comment,
    );
  }
  RatingModel({
    this.id,
    this.createdIt,
    required this.restaurantId,
    required this.userId,
    required this.reting,
    required this.comment,
  });

  final String? id;
  final String? createdIt;
  final String restaurantId;
  final String userId;
  final double reting;
  final String comment;

  Map<String, dynamic> toJson() {
    return {
      'restaurant_id': restaurantId,
      'user_id': userId,
      'rating': reting,
      'comment': comment,
    };
  }

  toEntity() {
    return RatingEntity(
      restaurantId: restaurantId,
      userId: userId,
      reting: reting,
      comment: comment,
    );
  }
}

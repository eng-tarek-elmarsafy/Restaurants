import 'package:restaurants/features/restaurant_details/domain/entites/reting_entity.dart';

class RetingModel {
  factory RetingModel.fromJson(Map<String, dynamic> data) {
    return RetingModel(
      id: data['id'],
      createdIt: data['created_it'],
      restaurantId: data['restaurant_id'],
      userId: data['user_id'],
      reting: data['reting'],
      comment: data['comment'],
    );
  }
  factory RetingModel.fromEntity(RatingEntity entity) {
    return RetingModel(
      id: entity.id,
      createdIt: entity.createdIt,
      restaurantId: entity.restaurantId,
      userId: entity.userId,
      reting: entity.reting,
      comment: entity.comment,
    );
  }
  RetingModel({
    required this.id,
    required this.createdIt,
    required this.restaurantId,
    required this.userId,
    required this.reting,
    required this.comment,
  });

  final String id;
  final String createdIt;
  final String restaurantId;
  final String userId;
  final double reting;
  final String comment;

  Map<String, dynamic> toJson() {
    return {
      'restaurant_id': restaurantId,
      'user_id': userId,
      'reting': reting,
      'comment': comment,
    };
  }
}

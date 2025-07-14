import 'package:restaurants/features/restaurant_details/domain/entites/reting_entity.dart';

class RetingModel {
  RetingModel({
    required this.id,
    required this.createdIt,
    required this.restaurantAd,
    required this.userId,
    required this.reting,
    required this.comment,
  });

  final String id;
  final String createdIt;
  final String restaurantAd;
  final String userId;
  final double reting;
  final String comment;

  fromEntity(RetingEntity entity) {
    return RetingModel(
      id: entity.id,
      createdIt: entity.createdIt,
      restaurantAd: entity.restaurantId,
      userId: entity.userId,
      reting: entity.reting,
      comment: entity.comment,
    );
  }

  toJson() {
    return {
      'restaurant_ad': restaurantAd,
      'user_id': userId,
      'reting': reting,
      'comment': comment,
    };
  }

  fromJson(Map<String, dynamic> data) {
    return RetingModel(
      id: data['id'],
      createdIt: data['created_it'],
      restaurantAd: data['restaurant_id'],
      userId: data['user_id'],
      reting: data['reting'],
      comment: data['comment'],
    );
  }
}

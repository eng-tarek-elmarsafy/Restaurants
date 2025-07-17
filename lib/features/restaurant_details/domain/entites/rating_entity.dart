class RatingEntity {
  RatingEntity({
    this.id,
    this.createdAt,
    required this.name,
    required this.restaurantId,
    required this.reting,
    required this.comment,
    required this.userId,
    this.imageUrl,
  });

  final String? id;
  final String? createdAt;
  final String restaurantId;
  final double reting;
  final String comment;
  final String name;
  final String userId;
  final String? imageUrl;
}

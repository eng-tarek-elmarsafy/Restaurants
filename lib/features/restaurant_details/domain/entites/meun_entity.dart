class MeunItemEntity {
  MeunItemEntity({
    required this.id,
    required this.restaurntId,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.imageUrl,
  });

  final String id;
  final String restaurntId;
  final String name;
  final String description;
  final String price;
  final String category;
  final String imageUrl;
}

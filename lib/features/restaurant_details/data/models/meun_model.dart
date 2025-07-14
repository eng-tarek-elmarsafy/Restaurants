import 'package:restaurants/features/restaurant_details/domain/entites/meun_entity.dart';

class MeunModel {
  factory MeunModel.fromJesom(Map<String, dynamic> data) {
    return MeunModel(
      id: data['id'],
      // restaurntId: data['restaurnt_id'],
      name: data['name'],
      description: data['description'],
      price: '${data['price']}',
      category: data['category'],
      imageUrl: data['image_url'],
    );
  }
  MeunModel({
    required this.id,
    // required this.restaurntId,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.imageUrl,
  });

  final String id;
  // final String restaurntId;
  final String name;
  final String description;
  final String price;
  final String category;
  final String imageUrl;

  toEntity() {
    return MenuItemEntity(
      id: id,
      // restaurntId: restaurntId,
      name: name,
      description: description,
      price: price,
      category: category,
      imageUrl: imageUrl,
    );
  }
}

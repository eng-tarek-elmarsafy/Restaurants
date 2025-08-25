class OrderItemEntity {
  OrderItemEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.quanitty,
    required this.totalPrice,
    required this.imageUrl,
    required this.category,
    required this.description,
  });
  final String id;
  final String name;
  final String price;
  final int quanitty;
  final double totalPrice;
  final String imageUrl;
  final String category;
  final String description;
}

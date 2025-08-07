class ReviewEntity {
  ReviewEntity({
    required this.name,
    required this.image,
    required this.ratting,
    required this.date,
    required this.reviewDescription,
  });
  final String name;
  final String image;
  final num ratting;
  final String date;
  final String reviewDescription;
}

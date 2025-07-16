import 'package:flutter/widgets.dart';
import 'package:restaurants/features/home/domain/entities/restaurant_entity.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/widgets/add_comment.dart';

class RatingViewBody extends StatelessWidget {
  const RatingViewBody({super.key, required this.restaurant});
  final RestaurantEntity restaurant;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [AddComment(restaurant: restaurant)]),
    );
  }
}

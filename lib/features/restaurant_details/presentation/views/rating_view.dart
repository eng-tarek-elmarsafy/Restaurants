import 'package:flutter/material.dart';
import '../../../home/domain/entities/restaurant_entity.dart';
import 'widgets/rating_view_bloc_consumer.dart';

class RatingView extends StatelessWidget {
  const RatingView({super.key, required this.restaurant});
  final RestaurantEntity restaurant;
  @override
  Widget build(BuildContext context) {
    return RatingViewBlocConsumer(restaurant: restaurant);
  }
}

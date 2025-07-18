import 'package:flutter/material.dart';
import 'package:restaurants/features/home/domain/entities/restaurant_entity.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/widgets/rating_view_bloc_consumer.dart';

class RatingView extends StatelessWidget {
  const RatingView({super.key, required this.restaurant});
  final RestaurantEntity restaurant;
  @override
  Widget build(BuildContext context) {
    return RatingViewBlocConsumer(restaurant: restaurant);
  }
}

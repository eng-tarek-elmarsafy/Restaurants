import 'package:flutter/material.dart';
import 'package:restaurants/features/home/domain/entities/restaurant_entity.dart';
import 'package:restaurants/features/restaurant_details/domain/entites/rating_entity.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/widgets/add_comment.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/widgets/rating_item.dart';

class RatingViewBody extends StatelessWidget {
  const RatingViewBody({
    super.key,
    required this.restaurant,
    required this.listOfRating,
  });
  final RestaurantEntity restaurant;
  final List<RatingEntity> listOfRating;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.separated(
            itemCount: listOfRating.length,
            itemBuilder: (context, index) {
              return RatingItem(rating: listOfRating.reversed.toList()[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 20);
            },
          ),
        ),

        Positioned(
          bottom: 40,
          right: 20,
          child: AddComment(restaurant: restaurant),
        ),
      ],
    );
  }
}

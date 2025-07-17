import 'package:flutter/widgets.dart';
import 'package:restaurants/features/home/domain/entities/restaurant_entity.dart';
import 'package:restaurants/features/restaurant_details/domain/entites/reting_entity.dart';

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
        ListView.builder(
          itemCount: listOfRating.length,
          itemBuilder: (context, index) {
            return Text(listOfRating[index].comment);
          },
        ),
      ],
    );
  }
}

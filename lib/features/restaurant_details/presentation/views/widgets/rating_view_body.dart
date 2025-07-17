import 'package:flutter/material.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/style/app_style.dart';
import 'package:restaurants/features/home/domain/entities/restaurant_entity.dart';
import 'package:restaurants/features/restaurant_details/domain/entites/rating_entity.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/widgets/add_comment.dart';

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
            return Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: kSecondaryColor,
                  child: Center(
                    child: Icon(
                      Icons.account_circle_rounded,
                      size: 60,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  listOfRating[index].comment,
                  style: AppStyle.buttonTextStyle,
                ),
              ],
            );
          },
        ),
        AddComment(restaurant: restaurant),
      ],
    );
  }
}

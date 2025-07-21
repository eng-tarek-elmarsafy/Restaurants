import 'package:flutter/material.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/style/app_style.dart';
import 'package:restaurants/core/widgets/user_avatar.dart';
import 'package:restaurants/features/restaurant_details/domain/entites/rating_entity.dart';

class AvatarAndRating extends StatelessWidget {
  const AvatarAndRating({super.key, required this.rating});

  final RatingEntity rating;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        UserAvatar(imageUrl: rating.imageUrl),
        Positioned(
          bottom: -3,
          left: -13,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: kPrimaryColor,
            ),

            child: Text(
              rating.reting.toString(),
              style: AppStyle.buttonTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../../core/function/get_date.dart';
import '../../../../../core/style/app_style.dart';
import '../../../domain/entites/rating_entity.dart';
import 'avatar_and_rating.dart';

class RatingInfo extends StatelessWidget {
  const RatingInfo({super.key, required this.rating});

  final RatingEntity rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AvatarAndRating(rating: rating),
        const SizedBox(width: 20),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(rating.name, style: AppStyle.buttonTextStyle),
            Text(getDate(rating.createdAt!), style: AppStyle.subtitleStyle),
          ],
        ),
      ],
    );
  }
}

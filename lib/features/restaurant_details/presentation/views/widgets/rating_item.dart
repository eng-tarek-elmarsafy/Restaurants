import 'package:flutter/material.dart';
import '../../../../../core/style/app_style.dart';
import '../../../domain/entites/rating_entity.dart';
import 'rating_info.dart';

class RatingItem extends StatelessWidget {
  const RatingItem({super.key, required this.rating});

  final RatingEntity rating;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RatingInfo(rating: rating),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Text(rating.comment, style: AppStyle.subtitleStyle),
        ),
      ],
    );
  }
}

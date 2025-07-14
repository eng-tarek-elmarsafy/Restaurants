import 'package:flutter/material.dart';
import 'package:restaurants/core/style/app_style.dart';
import 'package:restaurants/features/home/domain/entities/restaurant_entity.dart';

class TextInfoRestaurant extends StatelessWidget {
  const TextInfoRestaurant({super.key, required this.restaurant});

  final RestaurantEntity restaurant;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: restaurant.name, style: AppStyle.titleStyle),
              const TextSpan(text: ' '),
              TextSpan(
                text: '( ${restaurant.category} )',
                style: AppStyle.smallTextStyle,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(restaurant.description, style: AppStyle.buttonTextStyle),
        const SizedBox(height: 10),

        Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: 'العنوان', style: AppStyle.buttonTextStyle),
              const TextSpan(text: ' '),
              TextSpan(text: restaurant.address, style: AppStyle.subtitleStyle),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: 'مواعيد العمل',
                style: AppStyle.buttonTextStyle,
              ),
              const TextSpan(text: '  '),
              const TextSpan(text: 'من', style: AppStyle.subtitleStyle),
              const TextSpan(text: '   '),
              TextSpan(
                text: restaurant.openTime,
                style: AppStyle.subtitleStyle,
              ),
              const TextSpan(text: '   '),
              const TextSpan(text: 'الي', style: AppStyle.subtitleStyle),
              const TextSpan(text: '   '),
              TextSpan(
                text: restaurant.closeTime,
                style: AppStyle.subtitleStyle,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: 'سعر خدمه التوصيل وربما تكون متغيره',
                style: AppStyle.buttonTextStyle,
              ),
              const TextSpan(text: '  '),
              TextSpan(
                text: restaurant.deliveryFee,
                style: AppStyle.subtitleStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

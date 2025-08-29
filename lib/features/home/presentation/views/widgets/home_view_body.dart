import 'package:flutter/material.dart';
import '../../../../../constrains.dart';
import '../../../domain/entities/restaurant_entity.dart';
import 'restaurnt_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.restaurants});
  final List<RestaurantEntity> restaurants;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kBorderRadius),
      child: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemCount: restaurants.length,
            itemBuilder:
                (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: RestsurntItem(restaurant: restaurants[index]),
                ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/widgets/food_item.dart';

class MenuRestaurant extends StatelessWidget {
  const MenuRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
        childAspectRatio: 163 / 214,
      ),
      itemBuilder: (context, index) => const FoodItem(),
    );
  }
}

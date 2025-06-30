import 'package:flutter/material.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/function/height.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/widgets/food_item.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/widgets/menu_tabs_bar.dart';

class RestaurntDetailsBody extends StatelessWidget {
  const RestaurntDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const MenuTabsBar(),
          const Divider(color: kNeutralColor, height: 0),
          height(16),
          const Flexible(child: FoodMenu()),
        ],
      ),
    );
  }
}

class FoodMenu extends StatelessWidget {
  const FoodMenu({super.key});

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
